{ machineConfig, inputs, ... }:
{
  nix-homebrew = {
    enable = true;
    user = machineConfig.username;
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
  };
  
  homebrew = {
    casks = [
      "visual-studio-code"
    ];
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
    mutableTaps = false;
  };
}
