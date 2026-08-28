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
