# Dropbear for Android

## Compiling
1. Download source
    ```shell
    git clone --recursive https://github.com/NHellFire/dban.git
    ```

2. Edit the HOST variables in build.sh to match your environment if required  
3. Compile
    ```shell
    cd git/dropbear
    ../build.sh <arch>
    ```

    You will find the output in `git/target/<arch>`.  
    By default it is intended to be run from `/data/dropbear`, this can be changed using command line arguments.
4. Running

    ```shell
    ln -s dropbearmulti dropbear
    ln -s dropbearmulti dropbearkey
    ln -s dropbearmulti dbclient
    ln -s dropbearmulti scp
    # Generate host key
    ./dropbearkey -f dropbear_rsa_host_key -t rsa -s 4096
    # Starting server
    ./dropbear -A -N root -C <password> -U 0 -G 0
    ```

### Auth
This supports encrypted passwords using `crypt()`
Just add `-e` to the end of your server arguments and provide a password generated with `mkpasswd -mSHA-512`  
Note: `-e` MUST be specified last. Somehow it's being reset otherwise.

### SCP
For SCP to work you will need to symlink `dropbearmulti` to `/system/xbin/scp`
