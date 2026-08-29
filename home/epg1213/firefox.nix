{ config, pkgs, lib, ... }:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
  lock-empty-string = {
    Value = "";
    Status = "locked";
  };
  home = "/home/epg1213";
in
{
programs.firefox = {
  enable = true;

  languagePacks = [ "en-US" ];

  policies = {
    # Updates & Background Services
    AppAutoUpdate                 = false;
    BackgroundAppUpdate           = false;

    # Feature Disabling
    DisableBuiltinPDFViewer       = true;
    DisableFirefoxStudies         = true;
    DisableFirefoxAccounts        = true;
    DisableFirefoxScreenshots     = true;
    DisableForgetButton           = true;
    DisableMasterPasswordCreation = true;
    DisableProfileImport          = true;
    DisableProfileRefresh         = true;
    DisableSetDesktopBackground   = true;
    DisablePocket                 = true;
    DisableTelemetry              = true;
    DisableFormHistory            = true;
    DisablePasswordReveal         = true;

    # Access Restrictions
    BlockAboutConfig              = false;
    BlockAboutProfiles            = true;
    BlockAboutSupport             = true;

    # UI and Behavior
    DisplayMenuBar                = "never";
    DontCheckDefaultBrowser       = true;
    HardwareAcceleration          = false;
    OfferToSaveLogins             = false;
    DefaultDownloadDirectory      = "${home}/dl";

    # Privacy
    Preferences = {
      "extensions.pocket.enabled" = lock-false;
      "browser.newtabpage.pinned" = lock-empty-string;
      "browser.topsites.contile.enabled" = lock-false;
      "browser.newtabpage.activity-stream.showSponsored" = lock-false;
      "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
      "browser.newtabpage.activity-stream.showSearch" = lock-false;
      "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = lock-false;
      "browser.newtabpage.activity-stream.showWeather" = lock-false;
      "browser.newtabpage.activity-stream.feeds.topSites" = lock-false;
      "browser.newtabpage.activity-stream.feeds.topsites" = lock-false;
      "browser.newtabpage.activity-stream.hideLogo" = lock-true;
    };

    # Extensions
    ExtensionSettings = let
      moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
    in {
      "*".installation_mode = "blocked";

      "uBlock0@raymondhill.net" = {
        install_url       = moz "ublock-origin";
        installation_mode = "force_installed";
        updates_disabled  = true;
      };

      "{b1008ed7-506a-468d-b1c8-66712938dbcb}" = {
        install_url       = moz "hyprland-blue";
        installation_mode = "force_installed";
        updates_disabled  = true;
      };

    };

    # Extension configuration 
    "3rdparty".Extensions = {
      "uBlock0@raymondhill.net".adminSettings = {
        userSettings = rec {
          uiTheme            = "dark";
          uiAccentCustom     = true;
          uiAccentCustom0    = "#8300ff";
          cloudStorageEnabled = false;

          importedLists = [
            "https://filters.adtidy.org/extension/ublock/filters/3.txt"
            "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
          ];

          externalLists = lib.concatStringsSep "\n" importedLists;
        };

        selectedFilterLists = [
          "CZE-0"
          "adguard-generic"
          "adguard-annoyance"
          "adguard-social"
          "adguard-spyware-url"
          "easylist"
          "easyprivacy"
          "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
          "plowe-0"
          "ublock-abuse"
          "ublock-badware"
          "ublock-filters"
          "ublock-privacy"
          "ublock-quick-fixes"
          "ublock-unbreak"
          "urlhaus-1"
        ];
      };
    };
  };

  profiles.default.search = {
    force           = true;
    default         = "startpage";
    privateDefault  = "startpage";

    engines = {
      "Nix Packages" = {
        urls = [
          {
            template = "https://search.nixos.org/packages";
            params = [
              { name = "channel"; value = "unstable"; }
              { name = "query";   value = "{searchTerms}"; }
            ];
          }
        ];
        icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@np" ];
      };

      "Nix Options" = {
        urls = [
          {
            template = "https://search.nixos.org/options";
            params = [
              { name = "channel"; value = "unstable"; }
              { name = "query";   value = "{searchTerms}"; }
            ];
          }
        ];
        icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@no" ];
      };

      "NixOS Wiki" = {
        urls = [
          {
            template = "https://wiki.nixos.org/w/index.php";
            params = [
              { name = "search"; value = "{searchTerms}"; }
            ];
          }
        ];
        icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@nw" ];
      };
    };
  };
};

}
