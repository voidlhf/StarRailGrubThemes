{
  description = "A pack of GRUB2 themes for Honkai: Star Rail";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      systems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];
    in
    flake-utils.lib.eachSystem systems (system:
      let
        pkgs = import nixpkgs { inherit system; };

        themeNames = builtins.attrNames (builtins.readDir ./assets/themes);
        themePackages = builtins.listToAttrs (builtins.map
          (theme:
            let
              name = (builtins.replaceStrings [ "." ] [ "_" ] (pkgs.lib.strings.toLower theme)) + "-grub-theme";
            in
            {
              inherit name;
              value = pkgs.callPackage ./default.nix { inherit theme; };
            })
          themeNames);
      in
      {
        packages = {
          default = pkgs.callPackage ./default.nix { theme = "Acheron"; };
        } // themePackages;

        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [ nixpkgs-fmt nixd ];
        };

        nixosModules.default = ./module.nix;
      });
}
