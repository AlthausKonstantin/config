{ machineConfig, inputs, ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
    taps = [
      "homebrew/core"
      "homebrew/bundle"
      "homebrew/cask"
    ];
    casks = [
      "obsidian"
      "whatsapp"
      "signal"
      "wezterm"
    ];
  };
}
