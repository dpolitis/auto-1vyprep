FROM archlinux:latest

ENV WORKSPACE=/workspace
WORKDIR /workspace

COPY . .

RUN rm Dockerfile; \
    chmod +x scripts/1vyprep-get-roms.sh; \
    chmod +x scripts/build-iso.sh

RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
bsdtar -C / -xvf "$patched_glibc"

RUN pacman -Sy --noconfirm \
    wimlib \
    cdrkit \
    innoextract

RUN scripts/1vyprep-get-roms.sh; \
    cp scripts/1vprep.bat biosfiles/Bios/; \
    cp scripts/findstr.exe biosfiles/Bios/

ENTRYPOINT ["/workspace/scripts/build-iso.sh"]
CMD ["/workspace/win10.iso"]
