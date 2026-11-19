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
      "calibre"
      "obsidian"
      "signal"
      "whatsapp"
      "wezterm"
      "rectangle"
      "mac-mouse-fix"
    ];
  };
}
