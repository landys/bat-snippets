@echo off
::MAC=00508D7E5EBA
echo 正在设置本地连接TCP/IP属性, IP=222.205.28.86...
netsh interface ip set address name="本地连接" source=static addr=222.205.28.86 mask=255.255.255.0 gateway=222.205.28.1 gwmetric=0
netsh interface ip set dns name="本地连接" source=static addr=10.10.0.21 register=PRIMARY
echo 设置本地连接TCP/IP属性成功.
pause
