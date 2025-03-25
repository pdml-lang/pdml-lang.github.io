@echo off

%JAVA_HOME%\bin\java.exe -jar plantuml.jar -i AST_example.txt

xcopy AST_example.png ..\resources\images

start AST_example.png

pause
