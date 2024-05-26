@echo off
@REM ----------------------------------------------------------------------------
@REM Licensed to the Apache Software Foundation (ASF) under one
@REM or more contributor license agreements.  See the NOTICE file
@REM distributed with this work for additional information
@REM regarding copyright ownership.  The ASF licenses this file
@REM to you under the Apache License, Version 2.0 (the
@REM "License"); you may not use this file except in compliance
@REM with the License.  You may obtain a copy of the License at
@REM
@REM http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing,
@REM software distributed under the License is distributed on an
@REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
@REM KIND, either express or implied.  See the License for the
@REM specific language governing permissions and limitations
@REM under the License.
@REM ----------------------------------------------------------------------------

@echo off
setlocal

set MAVEN_PROJECTBASEDIR=%~dp0

if not defined JAVA_HOME goto error_no_java_home
if not exist "%JAVA_HOME%\bin\java.exe" goto error_no_java_home

set MAVEN_USER_HOME=%MAVEN_PROJECTBASEDIR%.m2
set MAVEN_WRAPPER_JAR=%MAVEN_PROJECTBASEDIR%.mvn\wrapper\maven-wrapper.jar
set MAVEN_WRAPPER_PROPERTIES=%MAVEN_PROJECTBASEDIR%.mvn\wrapper\maven-wrapper.properties
set MAVEN_WRAPPER_DOWNLOADER=%MAVEN_PROJECTBASEDIR%.mvn\wrapper\maven-wrapper-downloader.jar
set MAVEN_LOCAL_REPOSITORY=%MAVEN_PROJECTBASEDIR%.m2\repository
set MAVEN_CACHE=%MAVEN_PROJECTBASEDIR%.m2\wrapper\dists

for /f "delims=" %%i in ('findstr /R "^distributionUrl=" "%MAVEN_WRAPPER_PROPERTIES%"') do set MAVEN_DISTRIBUTION_URL=%%i
set MAVEN_DISTRIBUTION_URL=%MAVEN_DISTRIBUTION_URL:distributionUrl=%
for /f "delims=" %%i in ('findstr /R "^wrapperVersion=" "%MAVEN_WRAPPER_PROPERTIES%"') do set MAVEN_WRAPPER_VERSION=%%i
set MAVEN_WRAPPER_VERSION=%MAVEN_WRAPPER_VERSION:wrapperVersion=%
for /f "delims=" %%i in ('findstr /R "^mavenVersion=" "%MAVEN_WRAPPER_PROPERTIES%"') do set MAVEN_VERSION=%%i
set MAVEN_VERSION=%MAVEN_VERSION:mavenVersion=%

if not defined MAVEN_DISTRIBUTION_URL goto error_no_distribution_url

set MAVEN_DISTRIBUTION_FILE=%MAVEN_CACHE%\apache-maven-%MAVEN_VERSION-%MAVEN_WRAPPER_VERSION-bin.zip
if not exist "%MAVEN_DISTRIBUTION_FILE%" (
  "%JAVA_HOME%\bin\java.exe" -jar "%MAVEN_WRAPPER_DOWNLOADER%" "%MAVEN_WRAPPER_PROPERTIES%" "%MAVEN_WRAPPER_JAR%"
)

set MAVEN_EXECUTABLE=%MAVEN_USER_HOME%.m2\wrapper\dists\apache-maven-%MAVEN_VERSION-%MAVEN_WRAPPER_VERSION\bin\mvn
call "%MAVEN_EXECUTABLE%" %*

endlocal
exit /b %ERRORLEVEL%

:error_no_java_home
@echo Error: JAVA_HOME is not set and no 'java' command could be found in your PATH.
goto end

:error_no_distribution_url
@echo Error: Maven distribution URL not found in %MAVEN_WRAPPER_PROPERTIES%.
goto end

:end
@rem Prevent the window from closing immediately.
pause
