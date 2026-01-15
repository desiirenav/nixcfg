## Personal NixOS configuration

Here is my NixOS configuration. I am still learning how to use Linux especially NixOS so please do not jugde harshly my configuration. If you have any questions, advices or suggestions, you can contact me on discord, my username is *desiirenav*.

**Highlights**
- Impermanence
- Flakes
- ZFS partitionning
- Declarative theming inspired by stylix
- Wrappers for some packages

### Installation

At the time of writing this, the installation script is only made for my personal use and should not be used directly.

```
curl https://raw.githubusercontent.com/desiirenav/nixcfg/refs/heads/main/install.sh -o /home/nixos/install.sh && \
sudo sh ./install.sh
```

### Main tools/apps used
- **Compositor** : Niri
- **App Launcher**: Fuzzel
- **Colorscheme**: Base2tone Lavender Dark
- **Terminal**: Kitty
- **Shell**: Fish + Starship
- **Editor**: Neovim
- **File manager**: Nautilus, Yazi
- **PDF reader**: Zathura
- **Browser**: Zen Browser

### References

#### Basic Nix/NixOS knowledge
- https://github.com/vimjoyer

#### Installation script
- https://github.com/iynaix/dotfiles/blob/main/install.sh

#### Neovim Wrapper
- https://ayats.org/blog/neovim-wrapper

#### Impermanence
- https://guekka.github.io/nixos-server-1/
- https://willbush.dev/blog/impermanent-nixos/
- https://notashelf.dev/posts/impermanence
- https://github.com/Misterio77/nix-config

#### Colorscheme
-  https://github.com/atelierbram/Base2Tone, the lavender one

#### Theming templates
- https://github.com/nix-community/stylix
- https://github.com/chriskempson/base16-templates
- https://github.com/MrTipson/DiscordCSS/tree/master

#### Fuzzel config file
- https://github.com/VISHALKANNAN070/dotfiles/blob/main/fuzzel/fuzzel.ini

#### Wrappers
- https://github.com/Lassulus/wrappers 

#### Quickshell config
- The quickshell discord server
- https://github.com/Rexcrazy804/Zaphkiel/tree/master
- http://188.245.241.250:3000/lucy/quickshell
- https://github.com/imshinyu
- https://github.com/TobiasBak/dotfiles/tree/f95c94d0059062e7ecd85d2eff2b8dfce400c075
