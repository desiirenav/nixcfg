## My personal NixOS configuration

### Before reading
This configuration is an attempt to create something simple since i'm a beginner with nixos. Please take that in consideration before judging. For any questions or suggestions, you can contact me on Discord, my username is desiirenav.

### References

#### Readme
- [Rexcrazy804/Zaphkiel]

#### Fonts
- [shaunsingh/SFMono-Nerd-Font-Ligaturized]
- [Lyndeno/apple-fonts.nix]

#### Knowledge on Nix/NixOS
- [vimjoyer]

#### Installation script
- [iynaix/dotfiles]

#### Neovim wrapper from scratch
- [Neovim-wrapper]

#### Impermanence
- [Guekka]
- [Willbush]
- [Notashelf]
- [iynaix/dotfiles]

#### Hjem (A module system that offers a way to manage files)
- [Rexcrazy804/Zaphkiel]
- [Soliprem/nix-config]

#### Matugen templates
- [InioX/matugen-themes]
- [Soliprem/nix-config]
- [Abhra00/Matuprland]
- [mylinuxforwork/dotfiles]

### Main programs
- **Compositor:** [Niri]
- **Launcher:** [Fuzzel]
- **Theming:** [Matugen]
- **Terminal:** [Kitty]
- **Bar (soon):** [Ignis]
- **Editor:** [Neovim]
- **File manager:** [Yazi]

### Installation

For now the installation script is for personal use only and should not be used directly without modifications.

```
curl https://raw.githubusercontent.com/desiirenav/nixcfg/refs/heads/main/install.sh -o /home/nixos/install.sh && \
sudo sh ./install.sh
```

[Rexcrazy804/Zaphkiel]: https://github.com/Rexcrazy804/Zaphkiel/tree/master?tab=readme-ov-file
[shaunsingh/SFMono-Nerd-Font-Ligaturized]: https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized
[Lyndeno/apple-fonts.nix]: https://github.com/Lyndeno/apple-fonts.nix
[vimjoyer]: https://github.com/vimjoyer
[iynaix/dotfiles]: https://github.com/iynaix/dotfiles/tree/main
[Soliprem/nix-config]: https://github.com/Soliprem/nix-config/tree/main
[Abhra00/Matuprland]: https://github.com/Abhra00/Matuprland/tree/main
[InioX/matugen-themes]: https://github.com/InioX/matugen-themes
[mylinuxforwork/dotfiles]: https://github.com/mylinuxforwork/dotfiles
[Guekka]: https://guekka.github.io/nixos-server-1/
[Notashelf]: https://notashelf.dev/posts/impermanence
[willbush]: https://willbush.dev/blog/impermanent-nixos
[Neovim-wrapper]: https://ayats.org/blog/neovim-wrapper
[Niri]: https://github.com/YaLTeR/niri
[Kitty]: https://sw.kovidgoyal.net/kitty/
[Fuzzel]: https://codeberg.org/dnkl/fuzzel
[Matugen]: https://github.com/InioX/matugen
[Neovim]: https://neovim.io
[Yazi]: https://github.com/sxyazi/yazi
[Ignis]: https://github.com/ignis-sh/ignis
