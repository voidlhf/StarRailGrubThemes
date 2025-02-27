# Honkai: Star Rail Grub Themes
A pack of GRUB2 themes for Honkai: Star Rail

![banner](/assets/images/icon.png?raw=true)

## Design File & Image Resources
[Honkai: Star Rail Grub Theme Design File (Figma Design File)](https://www.figma.com/community/file/1354356022337074054/honkai-star-rail-grub-theme-design-file)

[StarRailRes (Image Resources)](https://github.com/Mar-7th/StarRailRes)


## Theme Description
> Access and download the required theme files from the **'themes'** folder within this project.The theme files with **'cn'** in the filename are intended for the **Chinese version**. We recommend that Chinese users utilize these versions.

## Installation
Using the `Guinaifen` theme as an example

1. Download & Unzip

2. Copy `Guinaifen` into grub themes directory
```shell
sudo cp -r Guinaifen /usr/share/grub/themes/
```

3. Edit `grub` file
```shell
sudo vim /etc/default/grub
```

4. Add the theme to the bottom of the text file
```shell
GRUB_THEME="/usr/share/grub/themes/Guinaifen/theme.txt"
```

5. Update grub
```shell
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

6. Reboot the computer

### For NixOS users
For NixOS users, it was prepered packages and NixOS module to install theme
#### With NixOS Module
1. Added flake into your configuration
```nix
inputs.honkai-railway-grub-theme.url = "github:voidlhf/StarRailGrubThemes";
```

2. Added honkai-railway-grub-theme as NixOS Module
```nix
# your configuration.nix
# ${system} - system architectuer e.g. x86_64-linux
imports = [ home-inputs.honkai-railway-grub-theme.nixosModules.${system}.default ];
```

3. Set up theme in your configuration
```nix
honkai-railway-grub-theme = {
    enable = true;
    # Remember
    # Theme name should have the same name as in assets/themes directory e.g. Dr.Ratio_cn is correct
    # 'theme' field is optional. Default theme is Acheron.
    theme = "RuanMei"; 
};
```
#### Without NixOS module
1. Added flake into your configuration
```nix
inputs.honkai-railway-grub-theme.url = "github:voidlhf/StarRailGrubThemes";
```

2. Added GRUB theme
```nix
boot.loader.grub = rec {
    # Remember. Each nix package from this repo have another name.
    # Packages name have 2 rules:
    # - lower case names e.g. RuaMei -> ruamei
    # - each '.' must be replaced by "_" e.g Dr.Ratio -> dr_ratio
    theme = inputs.inputs.honkai-railway-grub-theme.packages.${system}.<your_theme_name>-grub-theme;
    splashImage = "${theme}/background.png";
};
```

3. Rebuild your system
4. Reboot computer to see your theme :)

## Preview
![Tribbie](/preview/Tribbie.png)
![Mydei](/preview/Mydei.png)
![TheHerta](/preview/TheHerta.png)
![Aglaea](/preview/Aglaea.png)
![Sunday](/preview/Sunday.png)
![Fugue](/preview/Fugue.png)
![Lingsha](/preview/Lingsha.png)
![Feixiao](/preview/Feixiao.png)
![March7th-TheHunt](/preview/March7th-TheHunt.png)

[More Preview Images](https://github.com/voidlhf/StarRailGrubThemes/tree/master/preview)

The labels in the bottom right corner of the preview image will not be displayed in the theme file.
