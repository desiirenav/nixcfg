{ inputs, ... }: {
  perSystem = { pkgs, lib,  ...}: {
    packages.apple-fonts = pkgs.stdenv.mkDerivation (finalAttrs: {
      pname = "apple-fonts";
      version = "1.0";

      src = pkgs.fetchFromGitHub {
        owner = "0xsharkboy";
        repo = "Apple-Fonts-Collection";
        tag = "v${finalAttrs.version}";
        sha256 = "sha256-8EZ7fYy6CONgyj3dHOsaVSF0oMRH+SRZclwdrMSA0h8=";
      };

      dontBuild = true;

      installPhase = let
        fontDirs = ["SF-Pro"];
      in ''
        runHook preInstall

        mkdir -p $out/share/fonts/{opentype,truetype}

        ${lib.concatMapStringsSep "\n" (dir: ''
          cp ${dir}/*.otf $out/share/fonts/opentype/ 2>/dev/null || true
          cp ${dir}/*.ttf $out/share/fonts/truetype/ 2>/dev/null || true
        '')
        fontDirs}

      runHook postInstall
    '';

      meta = {
        description = "Apple Fonts Collection including SF Pro, SF Compact, SF Mono, and New York";
        homepage = "https://github.com/0xsharkboy/Apple-Fonts-Collection";
        changelog = "https://github.com/0xsharkboy/Apple-Fonts-Collection/releases/tag/v${finalAttrs.version}";
        license = lib.licenses.mit;
        platforms = lib.platforms.all;
      };
    });
  };
}
