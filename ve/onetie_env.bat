@echo off & setlocal EnableDelayedExpansion
@rem Wang Jinde
@rem 2014-05-12

rem 2.3 registry
echo Start registry...
cd /d z:\3rdParty
call Register.bat
cd ..\BuildScripts
call SetInstallRegistry.bat
call SetRegistry.bat
echo End registry.

rem 3.3.1 generate DSSCOMMaster.h/.cpp
echo Start generating DSSCOMMaster.h/.cpp...
cd /d z:\
msbuild "z:\COM\Projects\DSSCOMMaster\DSSCOMMaster.vcxproj" /t:Rebuild /p:Configuration=Debug /p:Platform="Win32"
cd /d z:\COM\IDL
perl ..\..\BuildScripts\one.pl -MSI_COM
make cleangenerated
make
echo End generating DSSCOMMaster.h/.cpp.

rem 3.3.2 generate XML_Constants.h/.cpp
echo Start generating XML_Constants.h/.cpp...
cd /d z:\SDK\XML
XMLHeaderGen.exe -in xml.mdb -out XML_Constants.h -h
cp XML_Constants.h XML_Constants.cpp Z:\COM\SourceCode\DSSIncludes
echo End generating XML_Constants.h/.cpp.

rem 3.4 is no use now according to Lei
rem 3.4 generate GeneratedSystemObjectsIDs.h/.cpp
rem echo Start generating GeneratedSystemObjectsIDs.h/.cpp...
rem cd /d z:\
rem cleartool co -unreserved -nc COM\COMShared\COMShared\PrivateSource\Source\GeneratedSystemObjectsIDs.h
rem cleartool co -unreserved -nc COM\COMShared\COMShared\PrivateSource\Source\GeneratedSystemObjectsIDs.cpp
rem cd /d z:\COM\COMShared\COMShared\PrivateSource\Source
rem perl GenSystemObjectsIDs.pl Z:\BinSource
rem echo End generating GeneratedSystemObjectsIDs.h/.cpp

rem 4 build one-tier-bundles
echo Start building one-tier-bundles
cd /d z:\BIWebApp\build
build one-tier-bundles
echo End building one-tier-bundles

