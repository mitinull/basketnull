@echo off
set /p version=Enter version number (e.g., 2.2): 
set filename=basketnull%version%.love

echo Cleaning previous builds...
del basketnull*.love 2>nul

echo Creating %filename%...
tar -acf basketnull.zip --exclude=.git --exclude=.gitignore --exclude=README.md --exclude=.vscode --exclude=basketnull*.love *
ren basketnull.zip %filename%

echo Done! Created %filename%.
pause >nul
