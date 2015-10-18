#!/bin/bash -e
sed -e "s/\$APP_USERNAME/$APP_USERNAME/g" -i test/config.js.circleci.dist
sed -e "s/\$APP_PASSWORD/$APP_PASSWORD/g" -i test/config.js.circleci.dist
