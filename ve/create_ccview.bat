@echo off & setlocal EnableDelayedExpansion
@rem Wang Jinde
@rem 2014-05-09

if [%4] == [] (
	call :usage %0
	exit /b 1
)

if [%5] neq [] (
	call :usage %0
	exit /b 1
)

if not exist "%4" (
	echo Cannot find the conspec file "%4".
	exit /b 2
)

if not exist "%1" (
	mkdir "%1"
)

rem save the spec file to a reachable place after changing the path
set spec_file=not_possible_a_conspect_name.conspec
copy %4 "%1"\!spec_file!

cd /d "%1"

rem create cc view
cleartool mkview -snapshot -tag %2 -vws %3\%2.vws %2

rem set conspec
cd %2
cleartool setcs -overwrite ..\!spec_file!

rem delete the temp file
del ..\!spec_file!

exit /b 0

:usage
echo usage: %1 parent_path cc_view_name vws_path view_spec
echo Create cc view with the conspec.
rem exit /b 1 only jump of the function :usage
exit /b 1