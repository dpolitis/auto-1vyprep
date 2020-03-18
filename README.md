# auto-1vyprep
                    
Downgrade any xx30 series ThinkPad to the latest [1vyrain compatible](https://github.com/gch1p/thinkpad-bios-software-flashing-guide#bios-versions) BIOS version.

This repo contains the necessary files to build a small win10 bootable image yourself, with all necessary files included, to flash compatible bios.

# Installing

1. Copy findstr.exe from a windows 10 installation (or iso) (usually in C:\Windows\System32) to "script" folder.

2. Build Docker image:
   ```console
   docker build --rm -t 1vyprep:v1.0 .
   ```
3. Copy an official windows 10 image somewhere on your disk.

4. Run Docker container to get bootable iso image in "result" folder.
   ```console
   docker run -d --rm -v /dev:/dev -v $PWD/result:/workspace/result -v path/to/original/win10.iso:/workspace/win10.iso --privileged -t 1vyprep:v1.0
   ```
5. Burn the winflash.iso image onto a flash drive.

6. Go into your BIOS setup. Navigate to **Security -> UEFI BIOS Update Option**. Set *Flash BIOS Updating by End-Users* to Enabled, and *Secure RollBack Prevention* to Disabled. 

**Make sure you are plugged into power while running this. You WILL brick if you lose power while flashing, guaranteed.**

7. Boot from the flash drive and follow the on-screen instructions.

8. That's it!

**NOTE:** Neither this tool nor auto-1vyrain will modify your EC. You are safe to flash your EC with the battery or keyboard mod at any time as long as you are on a version compatible with the EC mod (check compatibility [here](https://github.com/hamishcoleman/thinkpad-ec#compatibilty-warning)). Both auto-1vyprep and auto-1vyrain will only modify the BIOS region! You can safely use auto-1vyrain to update to the latest BIOS without losing your other mods! 

# License

All the code in this repo is licenced under GPLv3.

---

# Credits

This was a fun work to do over a free weekend.

Many thanks to [n4ru](https://1vyra.in/) for the original implementation.

Huge thanks go out to [gch1p](https://github.com/gch1p/thinkpad-bios-software-flashing-guide) for publishing the method used and [pgera](https://github.com/hamishcoleman/thinkpad-ec/issues/70#issuecomment-417903315) for the working commands, without them this would have not been possible.
