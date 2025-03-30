{ machineConfig, pkgs, ... }: {
  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${machineConfig.username} = {
      home.username = machineConfig.username;
      home.stateVersion = machineConfig.homeManager.stateVersion;
      home.packages = with pkgs; [

        # basic cli stuff
        ripgrep-all

        # git tools
        git
        delta
        git-filter-repo
        gh

        # vim 
        neovim

        # coding
        docker_26
        texliveFull
        python314
        rustup

        # misc
        maccy
        warp-terminal
      ];
      programs.zsh = {
        enable = true;
        history.save = 10000;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        plugins = [
          {
            # load my own p10k config file from this repo, contains my p10k theme
            name = "powerlevel10k-config";
            src = ../Zsh;
            file = ".p10k.zsh";
          }
          {
            # enable powerlevel10k theme
            name = "zsh-powerlevel10k";
            src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
            file = "powerlevel10k.zsh-theme";
          }
        ];
        oh-my-zsh = {
          # use oh-my-zsh for other plugins
          # TODO: Can I use oh-my-zsh to load ../Zsh/.p10k.zsh?
          enable = true;
          plugins = [
            "git"
          ];
        };
        shellAliases = {
          # alias to rebuild main flake of this repo
          update = "darwin-rebuild switch --verbose --show-trace --flake ~/config/NixDarwin";
          # alias of eza
          ls = "eza --all --icons=always --group-directories-first";
        };
      };
      programs.wezterm = {
        enable = true;
        extraConfig = builtins.readFile ../Wezterm/wezterm.lua;
        # extraConfig = ''
        #   -- Pull in the wezterm API
        #   local wezterm = require("wezterm")
        #
        #   -- This will hold the configuration.
        #   local config = wezterm.config_builder()
        #
        #   -- This is where you actually apply your config choices
        #
        #   config.font = wezterm.font("0xProto")
        #   config.font_size = 8
        #
        #   config.enable_tab_bar = false
        #
        #   config.window_decorations = "RESIZE"
        #
        #   config.window_background_opacity = 0.95
        #   config.macos_window_background_blur = 10
        #
        #   -- and finally, return the configuration to wezterm
        #   return config
        # '';
      };
      programs.eza = {
        enable = true;
        enableZshIntegration = true;
      };
      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = [
          "--cmd cd"
        ];
      };
      programs.fzf = {
        enable = true;
        enableZshIntegration = true;
        fileWidgetOptions = [
          "--preview 'bat -n --color=always --line-range :500 {}'"
        ];
        changeDirWidgetOptions = [
          "--preview 'eza --tree --color=always {} | head -200'"
        ];
      };
      programs.bat = {
        enable = true;
        config.theme = "TwoDark";
      };
    };
  };
}
