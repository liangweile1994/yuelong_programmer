#include "apt8l16_3_drv.h"
#include "stdio.h"

#define SCL_H()    HAL_GPIO_WritePin(APT8L16_3_SCL_GPIO_Port, APT8L16_3_SCL_Pin, GPIO_PIN_SET)
#define SCL_L()    HAL_GPIO_WritePin(APT8L16_3_SCL_GPIO_Port, APT8L16_3_SCL_Pin, GPIO_PIN_RESET)
#define SDA_H()    HAL_GPIO_WritePin(APT8L16_3_SDA_GPIO_Port, APT8L16_3_SDA_Pin, GPIO_PIN_SET)
#define SDA_L()    HAL_GPIO_WritePin(APT8L16_3_SDA_GPIO_Port, APT8L16_3_SDA_Pin, GPIO_PIN_RESET)
#define SDA_Read() HAL_GPIO_ReadPin(APT8L16_3_SDA_GPIO_Port, APT8L16_3_SDA_Pin)
#define IIC_DELAY  150  

/*I2CÑÓÊ±º¯Êý*/
static void I2c_Delay(uint8_t cnt)
{   
    while (cnt) 
     cnt--;  			/* Decrement counter until it is zero */
}
/*******************************************************/

static void SCL_Out(void)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	GPIO_InitStruct.Pin = APT8L16_3_SCL_Pin; 
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD; 
	GPIO_InitStruct.Pull = GPIO_PULLUP; 
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(APT8L16_3_SCL_GPIO_Port, &GPIO_InitStruct);
}

static void SDA_Out(void)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	GPIO_InitStruct.Pin = APT8L16_3_SDA_Pin; 
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD; 
	GPIO_InitStruct.Pull = GPIO_PULLUP; 
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(APT8L16_3_SDA_GPIO_Port, &GPIO_InitStruct);
}

static void SDA_In(void)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	GPIO_InitStruct.Pin = APT8L16_3_SDA_Pin; 
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT; 
	GPIO_InitStruct.Pull = GPIO_PULLUP; 
	HAL_GPIO_Init(APT8L16_3_SDA_GPIO_Port, &GPIO_InitStruct);
}

void APT8L16_3_I2c_Init(void)
{
	SDA_Out();
	SCL_Out();
	SDA_H();
	SCL_H();
}

static void I2c_Start(void)
{
	SDA_Out();
	SDA_H();
	I2c_Delay(IIC_DELAY);
	SCL_H();
	I2c_Delay(IIC_DELAY);
	I2c_Delay(IIC_DELAY);
	SDA_L();
	I2c_Delay(IIC_DELAY);
	I2c_Delay(IIC_DELAY);
	SCL_L();
	I2c_Delay(IIC_DELAY);
}

static void I2c_Stop(void)
{
	SDA_Out();
	SDA_L();
	I2c_Delay(IIC_DELAY);
	SCL_H();
	I2c_Delay(IIC_DELAY);
	SDA_H();
	I2c_Delay(IIC_DELAY);

}

static void I2c_SendByte(uint8_t  dat)
{
  uint8_t  i,j;
  j = dat;
  
	SDA_Out();
  for (i=0; i<8; i++)
  {
		I2c_Delay(IIC_DELAY);
    if ((j & 0x80)==0)
    { SDA_L();}
    else
    { SDA_H();}
    j <<=1;
    I2c_Delay(IIC_DELAY);
    SCL_H();
    I2c_Delay(IIC_DELAY);
		I2c_Delay(IIC_DELAY);
    SCL_L();
  }

}

static uint8_t I2c_RevByte(void)
{
  uint8_t i;
  uint8_t val = 0;
	SDA_In();
  for (i=0; i<8; i++)
  {
    I2c_Delay(IIC_DELAY);
    SCL_H();
    I2c_Delay(IIC_DELAY);
    val <<= 1;
    if( SDA_Read() )
    { 
			val++;}
    SCL_L();
    I2c_Delay(IIC_DELAY);
  }
  return val;
}

static uint8_t  I2c_WaitAck(void)
{
  uint8_t  cnt = 0;
	SDA_In();
	I2c_Delay(IIC_DELAY);
  SCL_H();
  I2c_Delay(IIC_DELAY);
  while(SDA_Read())
  {
    cnt++;
    if(cnt>=250)
    {
			SCL_L();
			I2c_Delay(IIC_DELAY);
      return FALSE;
    }
  }
  SCL_L();
  I2c_Delay(IIC_DELAY);
	return TRUE;
	
}

static void I2c_Send_NoAck(void)
{
	SDA_Out();
	SDA_H();
	I2c_Delay(IIC_DELAY);
	SCL_H();
	I2c_Delay(IIC_DELAY);
	SCL_L();
	I2c_Delay(IIC_DELAY);
}

uint8_t APT8L16_3_Send_OneByte(uint8_t dev_addr, uint8_t reg_addr, uint8_t dat)
{
	I2c_Start();
	I2c_SendByte(dev_addr);
	if(I2c_WaitAck() == FALSE)
	{
		return FALSE;
	}
	I2c_SendByte(reg_addr);
	if(I2c_WaitAck() == FALSE)
	{
		return FALSE;
	}
	I2c_SendByte(dat);
	I2c_WaitAck();
	I2c_Stop();
	return TRUE;
}

uint8_t APT8L16_3_Recv_OneByte(uint8_t dev_addr, uint8_t reg_addr)
{
	uint8_t ret;
	I2c_Start();
	I2c_SendByte(dev_addr);
	if(I2c_WaitAck() == FALSE)
	{
		return FALSE;
	}
	I2c_SendByte(reg_addr);
	if(I2c_WaitAck() == FALSE)
	{
		return FALSE;
	}
	I2c_Start();
	I2c_SendByte(dev_addr+1);
	if(I2c_WaitAck() == FALSE)
	{
		return FALSE;
	}
	ret = I2c_RevByte();
	I2c_Send_NoAck();
	I2c_Stop();
	return ret;
}

