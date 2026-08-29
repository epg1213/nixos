{ config, pkgs, lib, ... }:

{
  imports = [./hyprland ./ghostty.nix];
  
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
  home.username = "epg1213";
  home.homeDirectory = "/home/epg1213";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
    };
    initExtra = ''
      PS1="\n\[\033[38;5;45m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\] "
    '';
  };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."github.com" = {
      HostName = "github.com";
      User = "git";
      IdentityFile = "~/.ssh/github";
    };
  };
  home.packages = with pkgs; [
    brightnessctl
    hyprpaper
    bat
  ];
}
