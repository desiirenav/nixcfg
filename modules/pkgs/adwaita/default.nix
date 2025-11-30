{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
  nix-update-script,
  meson,
  ninja,
  dart-sass,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "adw-gtk3-custom";
  version = "6.4";

  src = fetchFromGitHub {
    owner = "lassekongo83";
    repo = "adw-gtk3";
    tag = "v${finalAttrs.version}";
    hash = "sha256-tuOv3uKOQJaKvMeiUqI0jAIQqgb0P8jiO/rnClSp7uU=";
  };

  nativeBuildInputs = [
    meson
    ninja
    dart-sass
  ];

  postPatch = ''
    substituteInPlace scss/gtk-3.0/_colors.scss \
      --replace "@fg@" "#${colors.foreground}" \
      --replace "@fg2@" "#${colors.color7}" \
      --replace "@bg0@" "#${colors.darker}" \
      --replace "@bg1@" "#${colors.background}" \
      --replace "@bg2@" "#${colors.mbg}"\
      --replace "@bg3@" "#${colors.mbg}" \
      --replace "@bg4@" "#${colors.color0}" \
      --replace "@red@" "#${colors.color1}" \
      --replace "@lred@" "#${colors.color9}" \
      --replace "@orange@" "#${colors.color3}" \
      --replace "@lorange@" "#${colors.color11}" \
      --replace "@yellow@" "#${colors.color3}" \
      --replace "@lyellow@" "#${colors.color11}" \
      --replace "@green@" "#${colors.color2}" \
      --replace "@lgreen@" "#${colors.color10}" \
      --replace "@cyan@" "#${colors.color6}" \
      --replace "@lcyan@" "#${colors.color15}" \
      --replace "@blue@" "#${colors.color4}" \
      --replace "@lblue@" "#${colors.color12}" \
      --replace "@purple@" "#${colors.color5}" \
      --replace "@lpurple@" "#${colors.color14}" \
      --replace "@pink@" "#${colors.color5}" \
      --replace "@lpink@" "#${colors.color14}" \
      --replace "@primary@" "#${colors.foreground}" \
      --replace "@secondary@" "#${colors.color15}"
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Unofficial GTK 3 port of libadwaita";
    homepage = "https://github.com/lassekongo83/adw-gtk3";
    license = lib.licenses.lgpl21Only;
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [
      ciferkey
      Gliczy
      normalcea
    ];
  };
})
