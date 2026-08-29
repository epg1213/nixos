{ config, pkgs, lib, ... }:

{

programs.waybar.enable = true;

programs.waybar.settings = {
  topBar = {
    layer = "top";
    position = "top";
    height = 30;
    modules-center = [
      "clock"
      #other (no comma)
    ];
    clock = {
      format-alt = "{:%a, %d. %b  %H:%M}";
    };
  };
  bottopBar = {
    layer = "top";
    position = "bottom";
    height = 30;
    modules-center = [
      "hyprland/workspaces"
      #other (no comma)
    ];
    "hyprland/workspaces" = {
      "format" = "{name} {windows}";
      "format-window-separator" = " ";
      "window-rewrite-default" = "";
      "window-rewrite" = {
        "class<com.mitchellh.ghostty>" = "";
        "class<com.mitchellh.ghostty> title<nvim .*>" = "";
        "class<firefox>" = "";
        "class<discord>" = "";
      };
    };

  };
  rightBar = {
    layer = "top";
    position = "right";
    width = 30;
    modules-center = [
      "battery"
      #other (no comma)
    ];
    battery = {
      format = "{icon}\n{capacity}%";
      format-icons = ["" "" "" "" ""];
    };
  };
  leftBar = {
    layer = "top";
    position = "left";
    width = 30;
    modules-center = [
      #other (no comma)
    ];
  };
};

programs.waybar.style = ''
  * {
    border: none;
    border-radius: 0;
    font-family: Source Code Pro;
    color: #00d7ff;
  }
  window#waybar {
    background: transparent;
  }
  #workspaces button {
    padding: 0 5px;
  }
'';

}
