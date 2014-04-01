@echo off & setlocal EnableDelayedExpansion 

set a=1
for /f "delims=" %%i in ('dir /b *.jpg') do ( 

  if not "%%~ni"=="%~n0" (
rem %%~ni, the file name without the extension
rem    if !a! LSS 10 (ren "%%i" "0!a!.jpg") else ren "%%i" "!a!.jpg"
    ren "%%i" "!a!.jpg" 
    set /a a+=1
 ) 
) 