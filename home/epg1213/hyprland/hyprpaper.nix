{ config, pkgs, lib, ... }:

{


home.file.".wallpaper.jpg".source = ./wallpapers/arch-hyprland.jpg;

services.hyprpaper.enable = true;
services.hyprpaper.settings = {
  splash = false;
  wallpaper = [
    {
      monitor = "";
      path = "~/.wallpaper.jpg";
    }
  ];
};

}
