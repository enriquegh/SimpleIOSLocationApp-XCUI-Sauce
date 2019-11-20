#!/bin/bash
curl -s https://api.github.com/repos/enriquegh/SimpleIOSLocationApp/releases/latest \
| gron | grep "browser_download_url" \
| cut -d " " -f 3 | tr -d \; | tr -d \" | xargs -I {} curl -OsL {}

curl -OsL https://s3.amazonaws.com/saucelabs-runner/v1.8/runner.jar

java -jar runner.jar config \
  --path config.yml \
  --apikey $SAUCE_RDC_API_KEY
