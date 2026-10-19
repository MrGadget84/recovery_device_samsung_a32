# AERA Recovery device tree — Samsung Galaxy A32 4G (a32)

This is an initial AERA 16.0 adaptation of the supplied Samsung A32 TWRP 12.1 tree.
The OnePlus `infiniti` tree was used only as an example of AERA build integration.
No OnePlus proprietary blobs, Qualcomm modules, GPU files, audio services, or Wi-Fi
helpers have been copied into this MediaTek device tree.

## Target information retained from the source tree

- Device: Samsung Galaxy A32 4G (`SM-A325F`, `a32`)
- SoC: MediaTek MT6768 (`k69v1_64_titan`)
- Kernel / DTB / DTBO: supplied prebuilt files from base `A325FXXSCDYB2`
- Recovery image header and Samsung `SEANDROIDENFORCE` packaging: retained from source tree
- Dynamic partitions: `system`, `vendor`, `product`, `odm`
- Userdata: source fstab says F2FS; encryption remains disabled until validated

## Build

From the root of the AERA 16.0 source checkout, after syncing the matching AERA manifest:

```bash
export AERA_BUILD_DEVICE=a32
source build/envsetup.sh
lunch twrp_a32-eng
mka recoveryimage
```

Expected output is under `out/target/product/a32/`. Inspect the actual generated image
and ensure it fits the physical 32 MiB recovery partition before any flashing.

## Important: this is not yet hardware-validated

This adaptation is a build-tree starting point, not a claim of a boot-tested recovery.
The provided kernel/DTB/DTBO are old prebuilt artifacts and must match the firmware
that will be used for testing. Do not flash until the image builds successfully, its
size and boot header are verified, and a known-good restore path is available.

Still requiring device testing / confirmation:

1. AERA source manifest and exact common config path on the selected AERA branch.
2. Whether the A32 boot chain accepts this exact recovery image packaging.
3. Display brightness node and touch input behavior under AERA.
4. USB ADB/MTP/sideload and fastbootd behavior.
5. Correct physical partition names and dynamic partition mappings on the target firmware.
6. Data decryption. AERA crypto flags are deliberately not enabled: the tree does not yet
   provide validated matching MTK Keymaster/KeyMint, Gatekeeper and dependent vendor blobs.
7. Wi-Fi, audio and hardware rendering are not configured by this initial adaptation.

Use recovery logs and a known-good backup to bring up one feature at a time. Never test
format-data, partition flashing, or boot-chain writes on the only copy of important data.
