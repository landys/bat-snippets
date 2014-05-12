@echo off & setlocal EnableDelayedExpansion

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
cd z:\
msbuild "z:\COM\Projects\DSSCOMMaster\DSSCOMMaster.vcxproj" /t:Rebuild /p:Configuration=Debug /p:Platform="Win32"
cd z:\COM\IDL
perl ..\..\BuildScripts\one.pl -MSI_COM
make cleangenerated
make
echo End generating DSSCOMMaster.h/.cpp.

rem 3.3.2 generate XML_Constants.h/.cpp
echo Start generating XML_Constants.h/.cpp...
cd z:\SDK\XML
XMLHeaderGen.exe -in xml.mdb -out XML_Constants.h -h
cp XML_Constants.h XML_Constants.cpp Z:\COM\SourceCode\DSSIncludes
echo End generating XML_Constants.h/.cpp.

rem 3.4 generate GeneratedSystemObjectsIDs.h/.cpp
echo Start generating GeneratedSystemObjectsIDs.h/.cpp...
cd z:\
cleartool co -unreserved -nc COM\COMShared\COMShared\PrivateSource\Source\GeneratedSystemObjectsIDs.h
cleartool co -unreserved -nc COM\COMShared\COMShared\PrivateSource\Source\GeneratedSystemObjectsIDs.cpp
cd z:\COM\COMShared\COMShared\PrivateSource\Source
perl GenSystemObjectsIDs.pl Z:\BinSource
echo End generating GeneratedSystemObjectsIDs.h/.cpp

rem 4 build one-tier-bundles
echo Start building one-tier-bundles
cd z:\BIWebApp\build
build one-tier-bundles
echo End building one-tier-bundles

