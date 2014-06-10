# Scripts for VE

I created a bat script to run the steps from 2.4 to 4.2 except for the steps to setup compilation environment or run i-server including 3.1, 3.2, 3.5, 3.6 and 4.1. If you have already gone through the tutorial once, which means the compilation environment is fine, then the script is enough. If not, please do 3.1, 3.2, 3.6 and 4.1 first. Please find the script (onetie_env.bat) in \\chn-team-ke1\Documentation\VE\scripts\env. Please run it in Visual Studio Command Prompt, since it needs msbuild to build VC++ projects.

I also created more bat scripts shared in the folder. Another useful one for one tie client is update_onetie.bat.


The script “update_onetie.bat” includes 3 things as follows.

1. Update all VOBs of the cc view in Z:\.
2. Copy and replace a specified build from “\\WAS-CC2-TECH\cm_bld1\9.5.1000.VERSION\DEBUG” to Z:\. The build version is specified in the bat parameter.
3. Call onetie_env.bat to set up one tie environment.

The usage is: update_onetie.bat short_version_number

I.E. update_onetie.bat 0067

It will use the build version 9.5.1000.0067.

All other scripts are for VE client.

- build_ve.bat – build ve projects, including patching DSSDataImport.h, adding preprocessor definition when compiling DSSController. But it won’t change DSSController project properties.
- update_build_ve.bat – Do what update_onetie.bat does, and then call build_ve.bat. I.E update_build_ve.bat 0067. It will do everything for VE environment.
- ve_patch.diff – used to patch DSSDataImport.h.
