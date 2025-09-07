@echo off
setlocal enabledelayedexpansion

set ICON_DIR=icons

:: output files
set HEADER=resource.h
set RC=Resources.rc

(
echo.
echo #ifdef APSTUDIO_INVOKED
echo #ifndef APSTUDIO_READONLY_SYMBOLS
echo #define _APS_NEXT_RESOURCE_VALUE        101
echo #define _APS_NEXT_COMMAND_VALUE         40001
echo #define _APS_NEXT_CONTROL_VALUE         1001
echo #define _APS_NEXT_SYMED_VALUE           101
echo #endif
echo #endif
) > %HEADER%


set ID=200
for %%f in (%ICON_DIR%\*.ico) do (
    echo #define IDI_ICON!ID! !ID! >> %HEADER%
    set /a ID+=1
)

:: start writing Resources.rc
echo #include "resource.h" > %RC%
echo. >> %RC%

set ID=200
for %%f in (%ICON_DIR%\*.ico) do (
    echo IDI_ICON!ID! ICON "%ICON_DIR%\\%%~nxf" >> %RC%
    set /a ID+=1
)

echo Generated %HEADER% and %RC%.
