@echo off
echo ���ñ�������TCP/IP����, ������...
set /p ip="IP��ַ(222.205.28.88): "
set /p mask="��������(255.255.255.0): "
set /p gateway="Ĭ������(222.205.28.1): "
set /p dns="��ѡDNS������(10.10.0.21): "

echo �������ñ�������TCP/IP����...
netsh interface ip set address name="��������" source=static addr=%ip% mask=%mask% gateway=%gateway% gwmetric=0
netsh interface ip set dns name="��������" source=static addr=%dns% register=PRIMARY
echo ���ñ�������TCP/IP���Գɹ�.
pause


