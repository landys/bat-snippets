@echo off
echo 设置本地连接TCP/IP属性, 请输入...
set /p ip="IP地址(222.205.28.88): "
set /p mask="子网掩码(255.255.255.0): "
set /p gateway="默认网关(222.205.28.1): "
set /p dns="首选DNS服务器(10.10.0.21): "

echo 正在设置本地连接TCP/IP属性...
netsh interface ip set address name="本地连接" source=static addr=%ip% mask=%mask% gateway=%gateway% gwmetric=0
netsh interface ip set dns name="本地连接" source=static addr=%dns% register=PRIMARY
echo 设置本地连接TCP/IP属性成功.
pause


