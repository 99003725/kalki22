@ECHO OFF

SETLOCAL DisableDelayedExpansion

:PARSE_CMD
IF "%1"=="" GOTO END_OF_PARSE_CMD
IF "%1"=="-project" SET PROJECT_NAME=%2
IF "%1"=="-workspace" SET WORKSPACE_LOC=-data %2
IF "%1"=="-build" SET BUILD_OPTION=-build
IF "%1"=="-clean" SET BUILD_OPTION=-cleanBuild
IF "%1"=="-console" SET CONSOLE=-vmargs -Dorg.eclipse.cdt.core.console=org.eclipse.cdt.core.systemConsole
IF "%1"=="-help" GOTO DISPLAY_HELP
SHIFT
GOTO PARSE_CMD
:END_OF_PARSE_CMD

:LAUNCH_CMD
ECHO stm32cubeidec.exe --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild %BUILD_OPTION% %PROJECT_NAME% %WORKSPACE_LOC% %CONSOLE%
stm32cubeidec.exe --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild %BUILD_OPTION% %PROJECT_NAME% %WORKSPACE_LOC% %CONSOLE%
GOTO END

:DISPLAY_HELP
ECHO To perform headless build or clean of your project in a workspace.
ECHO Example : "headless-build.bat -project myproj -workspace C:/myworkspace -build -console"
ECHO
ECHO Options :
ECHO -project		^[Project_Name^[/Config_Name^] ^| all^]
ECHO -workspace		^[Path^\To^\Workspace^] (required)
ECHO -build			To build project
ECHO -clean			To clean project
ECHO -console		To display console
GOTO END

:END
ENDLOCAL
