@echo off & setlocal EnableDelayedExpansion
@rem Wang Jinde
@rem 2014-05-27

if [%1] == [] (
	echo usage: %0 build_version_like_0067
	exit /b 0
)

call update_onetie.bat %1

call build_ve.bat
