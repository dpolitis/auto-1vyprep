#!/bin/bash
set -e

mount $1 winimg

mkwinpeimg --iso --windows-dir=winimg --start-script=start.cmd --overlay=biosfiles winflash.iso
umount winimg
cp winflash.iso result/
