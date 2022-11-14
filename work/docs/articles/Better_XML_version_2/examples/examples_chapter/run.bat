@echo off

call C:\aa\work\PML\Converter\build\bin\pmlc.bat convert ^
    --input_file chapter.pml ^
    --tag_start_stop_symbols []

pause
