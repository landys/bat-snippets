@echo off & setlocal EnableDelayedExpansion

if "%1"=="" (
  echo Usage: %0 output_file_path
  exit /b 1
)

if exist "%1" del "%1"

set a=1
for /f "delims=" %%i in ('dir /b /s *.jpg') do (
  echo !a! %%i>> "%1"
  set /a a+=1
)
