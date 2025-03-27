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

    casks = [
      "visual-studio-code"
    ];

    mutableTaps = false;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap";
  };
}
