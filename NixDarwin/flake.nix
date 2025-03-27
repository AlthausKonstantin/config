{
  inputs = {
    # nix package source
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    # darwin 
    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # homebrew
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = { nixpkgs, darwin, home-manager, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, ... }@inputs:
    let
      # properties and settings of my machine
      machineConfig = {
        system = "x86_64-darwin";
        hostname = "Konstantins-MacBook-Pro";
        username = "konstantinalthaus";
        home = "/Users/konstantinalthaus";
        homeManager.stateVersion = "24.11";
      };
      pkgs = import nixpkgs { system = machineConfig.system; config.allowUnfree = true; };
    in
    {
      darwinConfigurations.${machineConfig.hostname} = darwin.lib.darwinSystem {
        system = machineConfig.system;
        inherit pkgs;
        specialArgs = { inherit inputs machineConfig; };
        modules = [
          ./darwin.nix # load settings for mac os
          nix-homebrew.darwinModules.nix-homebrew
          ./brew.nix # load homebrew settings
          home-manager.darwinModules.home-manager
          (import ./home.nix) # load settings of home manager
        ];
      };
    };
}
