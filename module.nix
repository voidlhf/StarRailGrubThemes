{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.honkai-railway-grub-theme;
  themeNames = builtins.attrNames (builtins.readDir ./assets/themes);
in
{
  options = {
    honkai-railway-grub-theme = {
      enable = mkEnableOption "Enable Honaki Railway GRUB2 theme";
      theme = mkOption {
        type = types.enum themeNames;
        default = "Acheron";
        example = "Dr.Ratio";
        description = "Selected theme name. IMPORTANT! Theme name must be the same as in assert/themes directory";
      };
    };
  };

  config = mkIf (cfg.enable) {
    boot.loader.grub = {
      theme = pkgs.callPackage ./default.nix { theme = cfg.theme; };
      splashImage = ./assets/themes/${cfg.theme}/background.png;
    };
  };
}
