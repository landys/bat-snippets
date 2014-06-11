@echo off & setlocal EnableDelayedExpansion
@rem Wang Jinde
@rem 2014-05-26

if [%1] == [] (
	echo usage: %0 build_version_like_0067
	exit /b 0
)

set build_path=\\WAS-CC2-TECH\cm_bld1\9.5.1000.%1\DEBUG
if not exist "!build_path!" (
	echo Cannot find the build in the path "!build_path!"
	exit /b 1
)

cd /d z:\
cleartool update -nov .

xcopy "!build_path!\*" z:\ /E /C /R /I /Y

set apple_code_path=\\WAS-CC2-TECH\cm_bld1\9.5.1000.%1\Apple\MicroStrategyAnalyticsDesktop.app\Contents\Resources\code
set onetierapp_path=Z:\Kernel\Projects\OneTierClientProject\OneTierClientApp\Debug_Use_Msi_COM\code
if not exist "!onetierapp_path!" (
	mkdir !onetierapp_path!
)

if exist "!apple_code_path!" (
	xcopy "!apple_code_path!" "!onetierapp_path!" /E /C /R /I /Y
)

cd /d "%~dp0"

call onetie_env.bat
