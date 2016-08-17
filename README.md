### Building
Edit `build.sh` for your target and run from the `dropbear` folder


### Auth
This supports encrypted passwords using `crypt()`  
Just add `-e` to the end of your server arguments and provide a password generated with `mkpasswd -mSHA-512`  
Note: `-e` MUST be specified last. Somehow it's being reset otherwise.
