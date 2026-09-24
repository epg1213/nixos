{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      theme = "Abernathy";
      background-opacity = "0.75";
    };
  };
}
