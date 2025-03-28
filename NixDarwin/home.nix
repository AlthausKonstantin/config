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
        enableCompletion = true;
        # enableBashCompletion = true;
        # autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        histSize = 10000;
        prompInit = ''
          source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        '';
        # ohMyZsh = {
        #   enable = true;
        # };
        users.defaultUserShell = pkgs.zsh;
        # system.userActivationScripts.zshrc = "touch .zshrc";
        # environment.shells = with pkgs; [ zsh ];
      };
    };
  };
}
