{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nixvim.homeModules.nixvim ./autocompletion.nix ./rust.nix];

  home.packages = with pkgs; [
    ripgrep
  ];

  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    opts = {
      number = true;
      relativenumber = true;
    };

    colorschemes.catppuccin.enable = true;

    plugins.lualine.enable = true;
    plugins.transparent.enable = true;
    plugins.treesitter = {
      enable = true;
      highlight.enable = true;
    };
    plugins.telescope = {
      enable = true;
      keymaps."<leader>ff" = "find_files";
      keymaps."<leader>fg" = "live_grep";
    };

    plugins.gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        current_line_blame_opts = {
          virt_text = true;
          virt_text_pos = "eol";
        };
        signcolumn = true;
        signs = {
          add = {text = "│";};
          change = {text = "│";};
          changedelete = {text = "~";};
          delete = {text = "_";};
          topdelete = {text = "‾";};
          untracked = {text = "┆";};
        };
        watch_gitdir = {follow_files = true;};
      };
    };

    keymaps = [
      {
        action = "<Esc>:w<cr>";
        key = "<C-s>";
        mode = ["n" "i"];
      }
      {
        action = "<Esc>:q<cr>";
        key = "<C-x>";
        mode = ["n" "i"];
      }
      {
        action = "<Esc>:q!<cr>";
        key = "<C-S-x>";
        mode = ["n" "i"];
      }
      {
        action = "<Esc>";
        key = "jj";
        mode = ["i"];
      }
    ];
  };
}
