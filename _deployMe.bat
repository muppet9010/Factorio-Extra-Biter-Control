@ECHO OFF



REM GET CURRENT NAMES AND VERSIONS
SET folderpath=%cd%
SET batchfilename=%~n0%~x0


REM GET VERSION AND MOD NAME FROM INFO FILE
for /f "tokens=2 delims=:" %%a in ('type "%folderpath%\info.json"^|find "version"') do (
  set version=%%a & goto :continueVersion
)
:continueVersion
set version=%version:~1,-2%
for /f "tokens=2 delims=:" %%a in ('type "%folderpath%\info.json"^|find "name"') do (
  set modname=%%a & goto :continueModName
)
:continueModName
set modname=%modname:~1,-2%
SET modfoldername=%modname%_%version%



REM REMOVE OLD FOLDER
FOR /D %%G IN ("%APPDATA%\Factorio\mods\%modname%*") DO RMDIR /S /Q "%%~G"

REM CREATE EXCLUDE FILES LIST
ECHO .bat >> excludedfileslist.txt
ECHO .xcf >> excludedfileslist.txt
ECHO excludedfileslist.txt >> excludedfileslist.txt
ECHO mod-portal-graphics >> excludedfileslist.txt

REM COPY THE FILES
XCOPY "%folderpath%" "%APPDATA%\Factorio\mods\%modfoldername%" /S /E /Y /I /Q /EXCLUDE:excludedfileslist.txt

REM DELETE THE EXCLUDE FILES LIST
DEL /q excludedfileslist.txt





REM DELETE OLD SCRIPT OUTPUT
DEL /q %APPDATA%\Factorio\script-output\




ECHO Done
TIMEOUT 2