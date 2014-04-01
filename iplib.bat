@echo off
echo 正在设置本地连接TCP/IP属性, IP=10.214.20.216...
netsh interface ip set address name="本地连接" source=static addr=10.214.20.216 mask=255.255.255.0 gateway=10.214.20.1 gwmetric=0
netsh interface ip set dns name="本地连接" source=static addr=10.10.0.21 register=PRIMARY
echo 设置本地连接TCP/IP属性成功.
pause
