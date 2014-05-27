@echo off & setlocal EnableDelayedExpansion
@rem Wang Jinde
@rem 2014-05-27

cd /d z:\

msbuild "Kernel\Projects\VisualizationEngineClientProject\VisualizationEngineClient\VEDataModel\VEDataModel.vcxproj" /t:Rebuild /p:Configuration=Debug_Use_Msi_COM /p:Platform="Win32"
msbuild "Kernel\Projects\VisualizationEngineClientProject\ChartEngine\ChartEngine.vcxproj" /t:Rebuild /p:Configuration=Debug_Use_Msi_COM /p:Platform="Win32"
msbuild "Kernel\Projects\VisualizationEngineClientProject\VisualizationEngineClient\VECore\VECore.vcxproj" /t:Rebuild /p:Configuration=Debug /p:Platform="Win32"

rem patch to DSSDataImport.h and build DSSController
cleartool unco -rm Kernel\SourceCode\OneTierClient\DSSDataImport.h
cleartool update -ove Kernel\SourceCode\OneTierClient\DSSDataImport.h
cleartool co -unreserved -nc Kernel\SourceCode\OneTierClient\DSSDataImport.h
patch Kernel\SourceCode\OneTierClient\DSSDataImport.h < "%~dp0\ve_patch.diff"
msbuild "Kernel\Projects\OneTierClientProject\OneTierClientApp\DSSController\DSSController.vcxproj" /p:DefineConstants=DATAIMPORT_DLL_EXPORT /t:Rebuild /p:Configuration=Debug_Use_Msi_COM /p:Platform="Win32"

msbuild "Kernel\Projects\VisualizationEngineClientProject\VisualizationEngineClient\VEWinController\VEWinController.vcxproj" /t:Rebuild /p:Configuration=Debug_Use_Msi_COM /p:Platform="Win32"
msbuild "Kernel\Projects\VisualizationEngineClientProject\VisualizationEngineClient\VisualizationEngineClient\VisualizationEngineClient.vcxproj" /t:Rebuild /p:Configuration=Debug_Use_Msi_COM /p:Platform="Win32"
rem msbuild "Kernel\Projects\VisualizationEngineClientProject\VisualizationEngineClient\VETest\VETest.vcxproj" /t:Rebuild /p:Configuration=Debug_Use_Msi_COM /p:Platform="Win32"

rem build one tie client as well
msbuild "Kernel\Projects\OneTierClientProject\OneTierClientApp\OneTierClientApp\OneTierClientApp.vcxproj" /t:Rebuild /p:Configuration=Debug_Use_Msi_COM /p:Platform="Win32"