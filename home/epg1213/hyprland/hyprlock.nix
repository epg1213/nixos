{ config, pkgs, lib, ... }:

{

  home.file.".wallpaper-locked.png".source = ./wallpapers/nixos-hyprlock.png;
  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
  general = {
    hide_cursor = true;
    ignore_empty_input = true;
  };

  animations = {
    enabled = true;
    fade_in = {
      duration = 300;
      bezier = "easeOutQuint";
    };
    fade_out = {
      duration = 300;
      bezier = "easeOutQuint";
    };
  };

  background = [
    {
      path = "~/.wallpaper-locked.png";
    }
  ];

  input-field = [
    {
      size = "200, 50";
      position = "0, 0";
      monitor = "";
      dots_center = true;
      fade_on_empty = false;
      font_color = "rgba(1e1d22ff)";
      inner_color = "rgba(4fc2fbff)";
      outline_thickness = 0;
      placeholder_text = "";
      #shadow_passes = 2;
    }
  ];
};
}
