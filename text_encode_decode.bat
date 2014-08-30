@echo off
@rem Landys
@rem 2014-08-30

set str1=You are so fat
set str2=the recursive function computing her mass causes a stack overflow

set str3=Y ukartks kfao
set str4=ohtkrtcursmvtkfuncom nkc epuomngkhtrkeasskcaustskaksoacik vtrfl w

call :encode "%str1%"
call :encode "%str2%"

echo.

call :decode "%str3%"
call :decode "%str4%"
pause

goto :eof

:encode
set "str=%~1"
set str=%str:o=#%
set str=%str:t=o%
set str=%str:e=t%
set str=%str:m=e%
set str=%str:i=m%
set str=%str:k=i%
set str=%str: =k%
set str=%str:#= %
echo %str%
goto :eof

:decode
set "str=%~1"
set str=%str: =#%
set str=%str:k= %
set str=%str:i=k%
set str=%str:m=i%
set str=%str:e=m%
set str=%str:t=e%
set str=%str:o=t%
set str=%str:#=o%
echo %str%
goto :eof