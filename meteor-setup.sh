#!/bin/bash

# this script is used to generate a basic meteor project and adding packages often used with it

# meteor create $1
meteor create --typescript $1
cd $1
meteor add react-meteor-data accounts-password alanning:roles
meteor remove insecure autopublish
# bcrypt is required by meteor encryption
meteor npm install --save bcrypt

if [ $2 = "mobile" ]; then
  meteor add-platform ios android
fi

# things we could also add
# allow user to select js lib (svelt, vue, react etc.)
# allow user to choose between typescript template or normal js
# add MUI meteor npm install @mui/material @emotion/react @emotion/styled @mui/icons-material
