{ config, pkgs, lib, ... }:

{
  fonts.packages = with pkgs; [
    font-awesome_4
  ];

}
