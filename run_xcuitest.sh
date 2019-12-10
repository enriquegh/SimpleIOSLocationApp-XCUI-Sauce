#!/bin/bash
printf "Downloading SimpleLocationApp latest release from Github \n"
# curl -s https://api.github.com/repos/enriquegh/SimpleIOSLocationApp/releases/latest \
# | jq '.assets[]' | grep "browser_download_url" \
# | cut -d " " -f 4 | tr -d \; | tr -d \" | xargs -I {} curl -OsL {}
curl -OsL https://github.com/enriquegh/SimpleIOSLocationApp/releases/download/v1.0.1/SimpleLocationApp.ipa
curl -OsL https://github.com/enriquegh/SimpleIOSLocationApp/releases/download/v1.0.1/SimpleLocationAppUITests-Runner.ipa

printf "Downloading v1.8 of Sauce Labs Runner \n"
curl -OsL https://s3.amazonaws.com/saucelabs-runner/v1.8/runner.jar

printf "Starting test... \n"
java -jar runner.jar config \
  --path config.yml \
  --apikey $SAUCE_RDC_API_KEY
