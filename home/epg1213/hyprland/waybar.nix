{ config, pkgs, lib, ... }:

{

programs.waybar.enable = true;

programs.waybar.settings = {
  topBar = {
    layer = "top";
    position = "top";
    height = 30;
    modules-center = [
      "hyprland/workspaces"
      #other (no comma)
    ];
  };
  bottopBar = {
    layer = "top";
    position = "bottom";
    height = 30;
    modules-center = [
      "hyprland/workspaces"
      #other (no comma)
    ];
  };
  rightBar = {
    layer = "top";
    position = "right";
    width = 30;
    modules-center = [
      "hyprland/workspaces"
      #other (no comma)
    ];
  };
  leftBar = {
    layer = "top";
    position = "left";
    width = 30;
    modules-center = [
      "hyprland/workspaces"
      #other (no comma)
    ];
  };
};

programs.waybar.style = ''
  * {
    border: none;
    border-radius: 0;
    font-family: Source Code Pro;
  }
  window#waybar {
    background: transparent;
  }
  #workspaces button {
    padding: 0 5px;
  }
'';

}
