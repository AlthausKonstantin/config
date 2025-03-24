{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, darwin, home-manager, ... }@inputs:
    let
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
          ./darwin.nix
          home-manager.darwinModules.home-manager
          (import ./home.nix)
        ];
      };
    };
}
