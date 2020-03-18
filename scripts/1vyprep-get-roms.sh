#!/bin/bash

mkdir -p biosfiles/Bios
cd biosfiles/Bios

#https://support.lenovo.com/us/en/downloads/ds029187
curl -R https://download.lenovo.com/pccbbs/mobiles/g2uj17us.exe -o X230.EXE
#https://support.lenovo.com/us/en/downloads/ds029683
curl -R https://download.lenovo.com/pccbbs/mobiles/gcuj18us.exe -o X230t.EXE
#https://support.lenovo.com/us/en/downloads/ds029169
curl -R https://download.lenovo.com/pccbbs/mobiles/g5uj21us.exe  -o W530.EXE
#https://support.lenovo.com/us/en/downloads/ds029246
curl -R https://download.lenovo.com/pccbbs/mobiles/g4uj23us.exe -o T530.EXE
#https://support.lenovo.com/us/en/downloads/ds029724
curl -R https://download.lenovo.com/pccbbs/mobiles/g7uj13us.exe -o T430s.EXE
#https://support.lenovo.com/us/en/downloads/ds029252
curl -R https://download.lenovo.com/pccbbs/mobiles/g1uj31us.exe -o T430.EXE

for bios in `ls *.EXE`
    do innoextract $bios && find . -type f -name "*.FL1" \
    -exec cp {} $(basename -s .EXE $bios).FL1 \; && rm -rf app
done

innoextract T430.EXE
find app -type f -name "WinFlash64.exe" -exec cp {} . \;
rm -rf app *.EXE

