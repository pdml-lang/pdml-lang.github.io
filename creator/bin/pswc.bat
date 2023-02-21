@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  pswc startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and PSWC_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-enableassertions" "--enable-preview"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\pswc-0.1.0.jar;%APP_HOME%\lib\pdml-data-0.27.0.jar;%APP_HOME%\lib\pdml-ext-0.27.0.jar;%APP_HOME%\lib\pdml-ext-scripting-0.27.0.jar;%APP_HOME%\lib\pdml-ext-shared-0.27.0.jar;%APP_HOME%\lib\pdml-ext-types-0.27.0.jar;%APP_HOME%\lib\pdml-ext-utils-0.27.0.jar;%APP_HOME%\lib\pdml-parser-0.27.0.jar;%APP_HOME%\lib\pdml-reader-0.27.0.jar;%APP_HOME%\lib\pdml-shared-0.27.0.jar;%APP_HOME%\lib\pdml-utils-0.27.0.jar;%APP_HOME%\lib\pp-basics-0.21.0.jar;%APP_HOME%\lib\pp-commands-0.21.0.jar;%APP_HOME%\lib\pp-datatype-0.21.0.jar;%APP_HOME%\lib\pp-parameters-0.21.0.jar;%APP_HOME%\lib\pp-scripting-0.21.0.jar;%APP_HOME%\lib\pp-text-0.21.0.jar;%APP_HOME%\lib\pp-texttable-0.21.0.jar;%APP_HOME%\lib\ptte-0.5.0.jar;%APP_HOME%\lib\js-22.2.0.jar;%APP_HOME%\lib\regex-22.2.0.jar;%APP_HOME%\lib\truffle-api-22.2.0.jar;%APP_HOME%\lib\graal-sdk-22.2.0.jar;%APP_HOME%\lib\icu4j-71.1.jar


@rem Execute pswc
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %PSWC_OPTS%  -classpath "%CLASSPATH%" dev.pp.pswc.Start %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable PSWC_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%PSWC_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
