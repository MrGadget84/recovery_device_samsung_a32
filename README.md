## Recovery Device Tree for the Samsung Galaxy A32 4G (MTK)

## How-to compile it:

```sh
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_a32-eng
make recoveryimage
```

Blobs version:
> Kernel base: A325FXXSCDYB2

> Ramdisk, DTB, DTBO base: A325FXXSCDYB2

Kernel source:
> https://github.com/Luminous418/android_kernel_samsung_a32/tree/erofs


## AERA 16.0 adaptation
See [README_AERA.md](README_AERA.md) for the initial AERA bring-up tree and its known limitations.
