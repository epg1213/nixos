# ./hosts/blueeye/settings.nix
{ config, pkgs, lib, ... }:
{
  wayland.windowManager.hyprland.settings.bind = [

    {_args = ["SUPER + W"
    (lib.generators.mkLuaInline "hl.dsp.window.close()")];}

    {_args = ["SUPER + T"
    (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"ghostty\")")];}

    {_args = ["SUPER + F"
    (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"firefox\")")];}

    {_args = ["SUPER + D"
    (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"discord\")")];}

    {_args = ["SUPER + mouse:272"
    (lib.generators.mkLuaInline "hl.dsp.window.drag()")
    { mouse = true; }];}

    {_args = ["SUPER + mouse:273"
    (lib.generators.mkLuaInline "hl.dsp.window.resize()")
    { mouse = true; }];}

    {_args = ["XF86AudioRaiseVolume"
    (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+\")")
    { locked = true; repeating = true; }];}
    {_args = ["XF86AudioLowerVolume"
    (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-\")")
    { locked = true; repeating = true; }];}
    {_args = ["XF86AudioMute"
    (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle\")")
    { locked = true; repeating = true; }];}
    {_args = ["XF86AudioMicMute"
    (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle\")")
    { locked = true; repeating = true; }];}
    {_args = ["XF86MonBrightnessUp"
    (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"brightnessctl -e4 -n2 set 5%+\")")
    { locked = true; repeating = true; }];}
    {_args = ["XF86MonBrightnessDown"
    (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"brightnessctl -e4 -n2 set 5%-\")")
    { locked = true; repeating = true; }];}

    {_args = ["SUPER + ampersand"
    (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 1 })")];}
    {_args = ["SUPER + SHIFT + ampersand"
    (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 1 })")];}
    {_args = ["SUPER + eacute"
    (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 2 })")];}
    {_args = ["SUPER + SHIFT + eacute"
    (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 2 })")];}
    {_args = ["SUPER + quotedbl"
    (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 3 })")];}
    {_args = ["SUPER + SHIFT + quotedbl"
    (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 3 })")];}
    {_args = ["SUPER + apostrophe"
    (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 4 })")];}
    {_args = ["SUPER + SHIFT + apostrophe"
    (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 4 })")];}
    {_args = ["SUPER + parenleft"
    (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 5 })")];}
    {_args = ["SUPER + SHIFT + parenleft"
    (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 5 })")];}
    {_args = ["SUPER + minus"
    (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 6 })")];}
    {_args = ["SUPER + SHIFT + minus"
    (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 6 })")];}
    {_args = ["SUPER + egrave"
    (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 7 })")];}
    {_args = ["SUPER + SHIFT + egrave"
    (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 7 })")];}
    {_args = ["SUPER + underscore"
    (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 8 })")];}
    {_args = ["SUPER + SHIFT + underscore"
    (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 8 })")];}
    {_args = ["SUPER + ccedilla"
    (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 9 })")];}
    {_args = ["SUPER + SHIFT + ccedilla"
    (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 9 })")];}
    {_args = ["SUPER + agrave"
    (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 10 })")];}
    {_args = ["SUPER + SHIFT + agrave"
    (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 10 })")];}

  ];

}
