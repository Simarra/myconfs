{ config, pkgs, ... }:


let
  cozy-drive-local = pkgs.callPackage CozyDrive/default.nix {};

in {
  nixpkgs.config.allowUnfree = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "simara";
  home.homeDirectory = "/home/simara";
  home.packages = [
    pkgs.htop
    # pkgs.nodejs
    pkgs.brave
    pkgs.powerline-fonts
    pkgs.powerline-symbols
    pkgs.nix-zsh-completions
    pkgs.zsh-powerlevel9k
    pkgs.libreoffice
    pkgs.spotify
    pkgs.joplin
    pkgs.joplin-desktop
    pkgs.postman
    pkgs.qgis
    pkgs.dbeaver
    pkgs.signal-desktop
    pkgs.whatsapp-for-linux
    pkgs.gimp
    # pkgs.cozy-drive
    pkgs.ihaskell
    cozy-drive-local
    # pkgs.scribus
    # pkgs.haskell-language-server
  ];

  programs.fish.enable = true;

  programs.git = {
    enable = true;
    userName = "Simarra";
    userEmail = "loic.martel@protonmail.com";
  };

  programs.tmux = {
  enable = true;
  terminal = "tmux-256color";
  shortcut = "u";
  };

  programs.firefox = {
    enable = true;
     profiles.default = {
        id = 0;
        settings = {

          "browser.contentblocking.category" = "strict";
          "browser.search.defaultenginename" = "Qwant";
          "browser.search.selectedEngine" = "Qwant";
          "browser.urlbar.placeholderName" = "Qwant";
          "browser.search.region" = "FR";
          "distribution.searchplugins.defaultLocale" = "fr-FR";
          "general.useragent.locale" = "fr-FR";
          "browser.bookmarks.showMobileBookmarks" = true;
          "browser.search.hiddenOneOffs" =
            "Google,Yahoo,Bing,Amazon.com,Twitter";
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;

          
          "extensions.update.enabled" = false;

        };
      };
  };


  # # HIE overlay
  # self: super: 
  # let 
  #   all-hies = import (fetchTarball "https://github.com/haskell/haskell-language-server/tarball/master") {};
  # in {
  #   hies = all-hies.selection { selector = p: { inherit (p) ghc865 ghc844; }; };
  # }

programs.vscode = {
  enable = true;
   # haskell = {
   #   enable = true;
   #   hie = {
   #      enable = true;
   #      executablePath = "${pkgs.hies}/bin/hie-wrapper";
   #      };
   #     };
  package = pkgs.vscode;
      extensions = (with pkgs.vscode-extensions; [
      # ms-python.python
      # ms-azuretools.vscode-docker
      # eamodio.gitlens
      # vscodevim.vim
      # bbenoist.Nix
      # justusadam.language-haskell
      # haskell.haskell
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "vscode-language-pack-fr";
      publisher = "MS-CEINTL";
      version = "1.60.4";
      sha256 = "0r6a1v14z5mryrhqwhq9li1xc282x57f75yzbid2z0dnnz3af4yg";
    }
    {
      name = "remote-containers";
      publisher = "ms-vscode-remote";
      version = "0.195.0";
      sha256 = "43c66aa22c6205199c99bbb94ebf9992df2d427524b1fddb3d08f0c163c9332c";
    }

      ];
        userSettings = {
            "terminal.integrated.fontFamily" = "Hack";
            "editor.cursorBlinking" = "smooth";
            "vim.easymotion" = true;
        };
   };
  programs = {
     neovim = {
       enable =true;
       vimAlias=true;
       viAlias=true;
       withPython3 = true;
       plugins = with pkgs.vimPlugins; [
	 fugitive
	 gitgutter
	 vim-nix
         ayu-vim
         vim-airline
         vim-airline-themes
         haskell-vim
       ];
       extraConfig = ''
         let g:airline#extensions#tabline#enabled = 1
         set laststatus=2
         let g:airline_theme='fruit_punch'

         autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
         let g:airline_powerline_fonts = 1
         colorscheme ayu
         let ayucolor="mirage"
         set termguicolors

         set wrap

         set nu

         syntax on
         set title
         set hidden

         let mapleader=","

         " Arrows keys are for weaks.
         noremap <Up> <Nop>
         noremap <Down> <Nop>
         noremap <Left> <Nop>
         noremap <Right> <Nop>
         
         " Remap excape key
         inoremap jj <Esc>
         :tnoremap <Esc> <C-\><C-n>
         map <F2> :Lexplore<CR>
         '';
     };
   };

  # xdg.configFile."nvim/coc-settings.json".text = builtins.readFile ./coc-settings.json;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
}
