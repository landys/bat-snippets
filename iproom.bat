@echo off
::MAC=00508D7E5EBA
echo �������ñ�������TCP/IP����, IP=222.205.28.86...
netsh interface ip set address name="��������" source=static addr=222.205.28.86 mask=255.255.255.0 gateway=222.205.28.1 gwmetric=0
netsh interface ip set dns name="��������" source=static addr=10.10.0.21 register=PRIMARY
echo ���ñ�������TCP/IP���Գɹ�.
pause
