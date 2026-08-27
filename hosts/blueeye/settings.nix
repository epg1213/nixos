# ./hosts/blueeye/settings.nix
{ ... }:
{
  imports = [
    # settings which both systems share
#    ../../modules/hyprland/binds.nix

    # settings only for the desktop
#    ../../modules/hyprland/blueeye.nix
  ];

  # other settings ...
  networking.hostName = "blueeye"; # Define your hostname.
}
