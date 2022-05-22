#!/bin/sh

# this script is used to generate a basic meteor project and adding packages often used with it
# below will create a meteor app with MUI installed and mobile app support
# example: ./meteor-setup.sh my-app mobile templated

# 0 = false, 1 = true
inc_typescript=1
inc_templated=0
inc_mobile=0
proj_name=$1

# get all "flags"
while [ $# -gt 1 ]; do
  if [[ $2 = "mobile" ]]; then
    inc_mobile=1
  elif [[ $2 = "no-typescript" ]]; then
    inc_typescript=0
  elif [[ $2 = "templated" ]]; then
    inc_templated=1
  fi

  shift
done

echo -e "\tCreating Meteor App..."

if [[ $inc_typescript -eq 1 ]]; then
  meteor create --typescript $proj_name
else
  meteor create $proj_name
fi

cd $proj_name

echo -e "\tAdding common packages\n"
# add all commonly added packages
meteor add react-meteor-data accounts-password alanning:roles

echo -e "\n\tRemoving insecure packages"
# remove insecure packages
meteor remove insecure autopublish

if [[ $inc_mobile -eq 1 ]]; then
  echo -e "\n\tAdding Android and iOS support\n"

  meteor add-platform ios android
fi

# bcrypt is required by meteor encryption
meteor npm install --save bcrypt

if [[ $inc_templated -eq 1 ]]; then
  echo -e "\t\tInstalling MUI\n"

  meteor npm install @mui/material @emotion/react @emotion/styled @mui/icons-material

  echo -e "\n\t\tGo to https://mui.com/material-ui/getting-started/installation/#roboto-font to add required fonts and icons form MUI."
fi

# things we could also add
# allow user to select js lib (svelt, vue, react etc.)
# setup project with template code (with fonts and starting codes etc.)
