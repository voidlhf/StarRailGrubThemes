# Honkai: Star Rail Grub Themes
A pack of GRUB2 themes for Honkai: Star Rail

![banner](/assets/images/icon.png?raw=true)

## Theme Description
> Access and download the required theme files from the **'themes'** folder within this project.The theme files with **'cn'** in the filename are intended for the **Chinese version**. We recommend that Chinese users utilize these versions.

## Installation
Using the `Guinaifen` theme as an example

1. Download & Unzip

2. Copy `Guinaifen` into grub themes directory
```shell
sudo cp -r Guinaifen /usr/share/grub/themes
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
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

6. Reboot the computer
## Preview
![Sparkle](/preview/Sparkle.png)
![BlackSwan](/preview/BlackSwan.png)
![Dr. Ratio](/preview/Dr.Ratio.png)
![RuanMei](/preview/RuanMei.png)
![Argenti](/preview/Argenti.png)
![Huohuo](/preview/Huohuo.png)
![Luocha](/preview/Luocha.png)
![March7th](/preview/March7th.png)

[More Preview Images](https://github.com/voidlhf/StarRailGrubThemes/tree/master/preview)

The labels in the bottom right corner of the preview image will not be displayed in the theme file.
