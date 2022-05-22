# GMSS
Just a General Meteorjs Setup Script

This script was made to make the meteor app setup less copy/paste, with just one command you can add react-meteor-data, accounts-password, remove the insecure packages and optionally add mobile support.

Note: All values after project name can be in any order.

### Examples
```shell
# example 1
./meteor-setup.sh my-app

# example 2
./meteor-setup.sh my-app mobile
# above will add mobile support ontop of the normal app

# example 3
./meteor-setup.sh my-app mobile templated no-typescript
# will generate a project with MUI and no TypeScript
```
