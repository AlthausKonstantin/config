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
        zsh-powerlevel10k
        # zsh-forgit # https://github.com/wfxr/forgit, https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/shells/zsh/zsh-forgit/default.nix#L51
        # zsh-fzf-history-search
        # zsh-fzf-tab
        fzf
        bat
        eza
        zoxide
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
    };
  };
}
