{ lib
, stdenv
, fetchurl
, autoPatchelfHook
, dpkg
, libusb
, qtbase
, wrapQtAppsHook
}:

# nix-build -E 'with import <nixpkgs> {}; libsForQt5.callPackage ./xp-pen-star-06-driver.nix {}' --impure

stdenv.mkDerivation rec { 
  pname = "xp-pen-star-06-driver";
  version = "3.4.9-231023";

  src = fetchurl { 
    url = "https://www.xp-pen.de/download/file.html?id=1955&pid=374&ext=deb";
    sha256 = "60840372d7f2bf890fbd3fc911231a89b4e4fe7d6a94cd4d5a8f36a171095d1e";
    name = "XPPenLinux_3.4.9_231023.deb";
  };

  unpackPhase = "dpkg-deb -x $src .";

  nativeBuildInputs = [ 
    dpkg
    autoPatchelfHook
    wrapQtAppsHook
  ];

  buildInputs = [ 
    libusb
    qtbase
  ];

  qtWrapperArgs = [ 
    "--prefix" "QT_PLUGIN_PATH" ":" "${placeholder "out"}/lib/pentablet"
    "--prefix" "LD_LIBRARY_PATH" ":" "${placeholder "out"}/lib/pentablet/lib"
    "--prefix" "QT_QPA_PLATFORM" ":" "xcb"
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp -r usr/. $out
    mv $out/lib/pentablet/{resource.rcc,PenTablet} $out/bin
  '';

  meta = with lib; { 
    homepage = "https://www.xp-pen.de/download-374.html";
    description = "Driver for XP-PEN Pentablet drawing tablets";
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    maintainers = with maintainers; [ lillig ];
  };
}