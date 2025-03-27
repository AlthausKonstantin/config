{ machineConfig, pkgs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${machineConfig.username} = {
      home.username = machineConfig.username;
      home.stateVersion = machineConfig.homeManager.stateVersion;
      home.packages = with pkgs; [

        # basic cli stuff
        zsh-forgit # https://github.com/wfxr/forgit, https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/shells/zsh/zsh-forgit/default.nix#L51
        zsh-fzf-history-search
        zsh-fzf-tab
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
        obsidian
        warp-terminal
      ];
    };
  };
}
