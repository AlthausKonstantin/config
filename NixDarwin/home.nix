# https://nix-community.github.io/home-manager/
# https://nix-community.github.io/home-manager/options.xhtml
{ machineConfig, pkgs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${machineConfig.username} = {
      home.username = machineConfig.username;
      home.stateVersion = machineConfig.homeManager.stateVersion;
      home.packages = with pkgs; [
        zsh-forgit # https://github.com/wfxr/forgit, https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/shells/zsh/zsh-forgit/default.nix#L51
        zsh-fzf-history-search
        zsh-fzf-tab
        neovim
        fzf
        maccy
        delta
        git
        gh
        bat
        eza
        docker_26
        zoxide
        obsidian
        texliveFull
        warp-terminal
        ripgrep-all
        python314
        rustup
      ];
    };
  };
}
