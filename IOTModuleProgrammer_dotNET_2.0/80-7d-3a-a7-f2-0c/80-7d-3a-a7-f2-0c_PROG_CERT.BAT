@ECHO OFF
CLS
@ECHO Programming certificate file: 80-7d-3a-a7-f2-0c_nvs_ext.bin
@ECHO OFF
SET /p com_port="Enter COM port (example: COM6) : " 
@ECHO Programming...
@ECHO OFF
esptool.exe --port %com_port% -b 921600 write_flash 0x1B000 80-7d-3a-a7-f2-0c_nvs_ext.bin
PAUSE
