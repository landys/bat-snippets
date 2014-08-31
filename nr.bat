@echo off & setlocal EnableDelayedExpansion 

set a=1
for /f "delims=" %%i in ('dir /b *.jpg') do ( 

rem for jpg files, actually we can also remove the "if" line below. For it cannot have the same name as the running bat file.
  if not "%%~nxi"=="%~nx0" (
rem %%~ni, the file name without the extension
rem    if !a! LSS 10 (ren "%%i" "0!a!.jpg") else ren "%%i" "!a!.jpg"
    ren "%%i" "!a!.jpg" 
    set /a a+=1
 ) 
) 
