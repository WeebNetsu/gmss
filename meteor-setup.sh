#!/bin/bash

# this script is used to generate a basic meteor project and adding packages often used with it

meteor create $1
cd $1
meteor add react-meteor-data accounts-password
meteor remove insecure autopublish
meteor npm install --save bcrypt

if [ $2 = "mobile" ]; then
  meteor add-platform ios android
fi

# things we could also add
# allow user to select js lib (svelt, vue, react etc.)
