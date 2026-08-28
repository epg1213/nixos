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
  home.packages = with pkgs; [
    brightnessctl
#    waybar
    hyprpaper
  ];
#  home.file.".config/hypr/hyprland.lua".source = ./dotfiles/hypr/hyprland.lua;
}
