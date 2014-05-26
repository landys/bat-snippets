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

cd /d "%~dp0"

call ve_env.bat
