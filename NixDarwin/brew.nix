{ inputs, ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      extraFlags = [ "--verbose" ];
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
      "rectangle"
      "mac-mouse-fix"
    ];
  };
}
