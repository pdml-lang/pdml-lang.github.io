@echo off

cd ..

call pmlc ^
	PML_to_HTML ^
	input/index.pml ^
	--output output/HTML/index.html ^
    --open_file_cmd "cmd.exe /c code --goto \"[[file]]:[[line]]:[[column]]\""
