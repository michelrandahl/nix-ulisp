# nix-env -iA <profile-name> -f shell.nix
with import <nixpkgs> {};
let
  # Define a function to be run when the shell is entered
  shellHook = ''
    arduino-cli config init --overwrite
    arduino-cli lib update-index --additional-urls https://sandeepmistry.github.io/arduino-nRF5/package_nRF5_boards_index.json

    arduino-cli core update-index --additional-urls https://sandeepmistry.github.io/arduino-nRF5/package_nRF5_boards_index.json

    arduino-cli core uninstall arduino:avr
    arduino-cli core uninstall sandeepmistry:nRF5 --additional-urls https://sandeepmistry.github.io/arduino-nRF5/package_nRF5_boards_index.json

    arduino-cli core install arduino:avr
    arduino-cli core install sandeepmistry:nRF5 --additional-urls https://sandeepmistry.github.io/arduino-nRF5/package_nRF5_boards_index.json


  '';
  pkgs_i686 = pkgs.pkgsi686Linux;
in
mkShell {
  NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
    libudev-zero
    pkgs_i686.openocd
    pkgs_i686.glibc
    pkgs_i686.libudev-zero
    stdenv.cc.cc
    stdenv.cc.cc.lib
    zlib
    glib
    libusb
    openjdk11
    openjfx
    xorg.libXext
    xorg.libX11
    xorg.libXrender
    xorg.libXtst
    xorg.libXi
    tytools # for teensy (tycmd)
    avrdude
    gnumake
    glibc
    glibc_multi
    gcc
  ];
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";
  buildInputs = [
    pkgs_i686.glibc
    pkgs_i686.libudev-zero
    libudev-zero
    pkgs_i686.openocd
    libusb
    stdenv.cc.cc.lib
    zlib
    glib
    arduino-cli
    arduino-core
    unzip
    patchelf
    openjdk11
    openjfx
    patchelf
    avrdude
    gnumake
    glibc
    glibc_multi
    gcc
    picocom
  ];
  shellHook = shellHook;
}
