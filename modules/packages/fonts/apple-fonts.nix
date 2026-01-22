{ lib, stdenv, fetchurl, unzip, p7zip}:

stdenv.mkDerivation rec {
  pname = "apple-fonts";
  version = "1";

  pro = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
    sha256 = "sha256-Lk14U5iLc03BrzO5IdjUwORADqwxKSSg6rS3OlH9aa4=";
  };

  compact = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg";
    sha256 = "sha256-mcMM/cbmOA5ykyIb74bid9vU6wyl8nVwkvkd+VlOdwo=";
  };

  ny = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/NY.dmg";
    sha256 = "sha256-HC7ttFJswPMm+Lfql49aQzdWR2osjFYHJTdgjtuI+PQ=";
  };

  nativeBuildInputs = [ p7zip ];

  sourceRoot = ".";

  dontUnpack = true;

  installPhase = ''
    7z x ${pro}
    cd SFProFonts 
    7z x 'SF Pro Fonts.pkg'
    7z x 'Payload~'
    mkdir -p $out/fontfiles
    mv Library/Fonts/* $out/fontfiles
    cd ..
    7z x ${compact}
    cd SFCompactFonts
    7z x 'SF Compact Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles
    cd ..
    7z x ${ny}
    cd NYFonts
    7z x 'NY Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles
    mkdir -p $out/usr/share/fonts/OTF $out/usr/share/fonts/TTF
    mv $out/fontfiles/*.otf $out/usr/share/fonts/OTF
    mv $out/fontfiles/*.ttf $out/usr/share/fonts/TTF
    rm -rf $out/fontfiles
  '';

  meta = {
    description = "Apple San Francisco, New York fonts";
    homepage = "https://developer.apple.com/fonts/";
    license = lib.licenses.unfree;
  };
}

