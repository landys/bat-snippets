@echo off
echo 正在设置本地连接TCP/IP属性, dhcp...
netsh interface IP set address "本地连接" source=dhcp
netsh interface IP set dns "本地连接" source=dhcp
echo 设置本地连接TCP/IP属性成功.
pause

