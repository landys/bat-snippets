@echo off
echo �������ñ�������TCP/IP����, IP=10.214.20.216...
netsh interface ip set address name="��������" source=static addr=10.214.20.216 mask=255.255.255.0 gateway=10.214.20.1 gwmetric=0
netsh interface ip set dns name="��������" source=static addr=10.10.0.21 register=PRIMARY
echo ���ñ�������TCP/IP���Գɹ�.
pause
