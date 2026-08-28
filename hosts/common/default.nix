# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
#      ./hardware-configuration.nix
    ];
  nixpkgs.config.allowUnfree = true;
fonts.packages = with pkgs; [
  font-awesome_4
];
  networking.wireless.iwd = {
    enable = true;
    settings = {
      Network.EnableIPv6 = false;
      Settings.AutoConnect = true;
    };
  };

  services.displayManager = {
    gdm.enable = true;
    defaultSession = "hyprland";
  };

  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.epg1213 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.bash;
    home = "/home/epg1213";
    packages = with pkgs; [
      firefox
      neovim
      discord
    ];
    initialPassword = "changeme";
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    wget
    git
    ghostty
    kitty
    tree
  ];

  # Locales
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";
  console.keyMap = "fr";
  services.xserver.xkb.layout = "fr";

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
  };

  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = true;
    };
    stateVersion = "26.05"; # don't touch this
  };

}

