{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [./hyprland ./ghostty.nix ./firefox.nix];

  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
  home.username = "nezumizoe";
  home.homeDirectory = "/home/nezumizoe";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
    };
    initExtra = ''
      PS1="\n\[\033[38;5;45m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\] "
    '';
  };
  home.packages = with pkgs;
  with inputs; [
    prismlauncher
    discord
    brightnessctl
    hyprpaper
    hyprshot
    curseforge.packages.${stdenv.hostPlatform.system}.default
  ];
  #dconf.settings = {
  #  "org/gnome/desktop/interface" = {
  #    color-scheme = "prefer-dark";
  #  };
  #};
}
