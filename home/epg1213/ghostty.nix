{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      theme = "Abernathy";
      background-opacity = "0.75";
      keybind = [
        "ctrl+h=goto_split:left"
        "ctrl+j=goto_split:down"
        "ctrl+k=goto_split:up"
        "ctrl+l=goto_split:right"
        "alt+tab=goto_split:next"
        "ctrl+shift+h=new_split:left"
        "ctrl+shift+j=new_split:down"
        "ctrl+shift+k=new_split:up"
        "ctrl+shift+l=new_split:right"
      ];
    };
  };
}
