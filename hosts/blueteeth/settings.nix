# ./hosts/blueteeth/settings.nix
{ ... }:
{
  imports = [
    # settings which both systems share
#    ../../modules/hyprland/binds.nix

    # settings only for the laptop
#    ../../modules/hyprland/blueteeth.nix
  ];

  # other settings ...
#  networking.hostName = "blueteeth"; # Define your hostname.
}
