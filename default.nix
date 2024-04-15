{ stdenvNoCC
, lib
, theme
}:

let
  themes = builtins.attrNames (builtins.readDir ./assets/themes);
in

assert builtins.any (x: x == theme) themes;

stdenvNoCC.mkDerivation {
  name = "StarRailGrubThemes";

  src = ./.;

  installPhase = "cp -r ./assets/themes/${theme} $out";

  meta = with lib; {
    homepage = "https://github.com/voidlhf/StarRailGrubThemes";
    description = "A pack of GRUB2 themes for Honkai: Star Rail";
    license = licenses.gpl3;
    maintainers = with maintainers; [ Wittano ];
    platforms = platforms.linux;
  };
}