#!/bin/bash

osx_tabname() {
  printf "\e]1;$1\a"
}

osx_newtab() {
  TAB_NAME=$1
  COMMAND=$2
  # ! Requires allowing osascript accessibility on OSX (potentially automator)
  osascript \
    -e "tell application \"Terminal\"" \
    -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
    -e "do script \"printf '\\\e]1;$TAB_NAME\\\a'; $COMMAND\" in front window" \
    -e "end tell" > /dev/null
}

osx_random()
{
  # Get length as parameter
  LENGTH=$1
  # If no length specified, use eight. This can be channged accordingly. :)
  LENGTH=${LENGTH:-8};
  cat /dev/urandom | env LC_CTYPE=EN.UTF8 tr -dc A-Z0-9 | head -c ${LENGTH}; echo
}

osx_send_sql_env_vars()
{
  SQL_QUERY_CONTENT=$1; # Parameter containing query content.
  # Assumes the following environment variables have been declared
  osx_send_sql $SQL_DB_HOST $DB_INITIAL_CATALOG $DB_USER_ID $DB_PASSWORD $SQL_QUERY_CONTENT;
}

osx_send_sql()
{
  SQL_DB_HOST_PARAM=$1;
  SQL_DB_INITIAL_CATALOG_PARAM=$2;
  SQL_DB_USER_ID_PARAM=$3;
  SQL_DB_PASSWORD_PARAM=$4;
  SQL_QUERY_CONTENT=$5; # Parameter containing query content.

  sqlcmd -S $SQL_DB_HOST_PARAM -d $SQL_DB_INITIAL_CATALOG_PARAM -U $SQL_DB_USER_ID_PARAM -P $SQL_DB_PASSWORD_PARAM -Q $SQL_QUERY_CONTENT;
}

osx_run__npmlocal()
{
  npm install;
  npm run local;
}

osx_run__chrome_debug()
{
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222
}

# brew install openjdk
# sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
# clone and download: https://github.com/SonarSource/docker-sonarqube
# cd docker-sonarqube/9/community
# docker build -t sonarqube-arm .
# sudo docker run --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -d -p 9000:9000 sonarqube-arm
# download sonar-scanner-msbuild: https://github.com/SonarSource/sonar-scanner-msbuild
osx_sonar()
{
  # Project name passed into command.
  BRANCH_NAME=$1;

  # Change to wherever you download and extract the sonar-scanner-msbuild file
  SONAR_LOCATION=$HOME/tools/sonar-scanner-msbuild/SonarScanner.MSBuild.dll;

  dotnet                                                      \
    $SONAR_LOCATION                                           \
    begin                                                     \
    /k:$BRANCH_NAME                                           \
    /d:sonar.login=admin                                      \
    /d:sonar.password=Test123!                                \
    /d:sonar.coverage.exclusions=\"\*\*Tests\*.cs\"           \
    /d:sonar.cs.opencover.reportsPaths=\"\*\*/TEST.lcov.xml\" ;


  dotnet                                      \
    test                                      \
    --filter FullyQualifiedName\!~Integration \
    /p:CollectCoverage=true                   \
    /p:CoverletOutputFormat=opencover         \
    /p:CoverletOutput=./TEST.lcov.xml         ;

  dotnet build;

  dotnet                       \
    $SONAR_LOCATION            \
    end                        \
    /d:sonar.login=admin       \
    /d:sonar.password=Test123! ;
}