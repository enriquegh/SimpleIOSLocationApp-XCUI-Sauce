#!/bin/bash
printf "Downloading SimpleLocationApp latest release from Github \n"
curl -s https://api.github.com/repos/enriquegh/SimpleIOSLocationApp/releases/latest \
| gron | grep "browser_download_url" \
| cut -d " " -f 3 | tr -d \; | tr -d \" | xargs -I {} curl -OsL {}

printf "Downloading v1.8 of Sauce Labs Runner \n"
curl -OsL https://s3.amazonaws.com/saucelabs-runner/v1.8/runner.jar

printf "Starting test... \n"
java -jar runner.jar config \
  --path config.yml \
  --apikey $SAUCE_RDC_API_KEY
