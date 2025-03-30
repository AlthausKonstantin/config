{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      pname = "maccy";
      version = "1.0.0";

      src = pkgs.fetchurl {
        url = "https://github.com/p0deje/Maccy/releases/download/1.0.0/Maccy.app.zip";
        sha256 = "sha256-+YlZH5U+/B4CQZMNL4U+ehg9KgI9TciS1CMQ0llBL08="; # got correct hash from error msg...
      };

      dontUnpack = true;

      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/maccy
        chmod +x $out/bin/maccy
      '';
    })
  ];
}
