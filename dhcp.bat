@echo off
echo �������ñ�������TCP/IP����, dhcp...
netsh interface IP set address "��������" source=dhcp
netsh interface IP set dns "��������" source=dhcp
echo ���ñ�������TCP/IP���Գɹ�.
pause

