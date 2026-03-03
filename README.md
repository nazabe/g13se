# Moto g13se Builder

Custom firmware A14 based on stock without bloatware for penangf Moto G13 & configuration for LMC8.4 GCAM.

## Features

- Removed Motorola bloatware software (even those that could not be removed manually).
- Removed pre-installation of all the bloatware from Google.
- Pre-installed lightweight open-source alternative applications.
- Heavy applications have been replaced with alternatives **[In the process...]**

## How to build
- Download your firmware from lolinet (https://mirrors.lolinet.com/firmware/lenomola/2023/penangf/official/)
- Install dependecies
  ```shell
  sudo pacman -S android-tools
  ```
- Move image super.img to the root project directory
- Run the ```build.sh``` script to modify the firmware 
```shell
./build.sh super.img
```
- Install via script in fastbootd mode to test the modified firmware
```shell
./install.sh
```
