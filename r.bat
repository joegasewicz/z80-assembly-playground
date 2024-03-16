@echo off
call m.bat
if not errorlevel 1 (
    bin\hdfmonkey put "C:\ZX80 Dev Environment\sdcard\tbblue-512M.mmc" project1.nex
    bin\CSpect.exe -r -brk -w3 -zxnext -nextrom -map=project1.map -mmc="C:\ZX80 Dev Environment\sdcard\tbblue-512M.mmc"
)