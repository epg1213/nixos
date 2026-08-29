# ./hosts/blueeye/settings.nix
{ config, pkgs, lib, ... }:
{
  imports = [./binds.nix ./waybar.nix ./hyprpaper.nix];
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    mod = {
      _var = "SUPER";
    };

  config = {
    animations = {
      enabled = false;
    };
    input = {
      kb_layout = "fr";
      touchpad = {
        natural_scroll = true;
      };
    };   
    general = {
      col = { active_border = "#00b7ef"; };
      gaps_in = 5;
      gaps_out = 2;
      border_size = 2;
    };
    decoration = {
      rounding = 10;
    };
  };

  on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline "function()\n  hl.exec_cmd(\"waybar\")\nend")
    ];
  };
};

}
