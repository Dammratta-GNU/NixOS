{ config, pkgs, lib, ... }:

let
  kali-themes = pkgs.stdenv.mkDerivation rec {
    pname = "kali-themes";
    version = "1.0";

    src = pkgs.fetchurl {
      url = "https://github.com/Dammratta-GNU/NixOS/raw/refs/heads/main/Customization/Resources/kali-themes.tar.gz";
      sha256 = "sha256-dWibJjMmG/TdfqDQ07+Tj2E9R1ewD7psiurqwjp0zVA=";
    };

    sourceRoot = ".";

    installPhase = ''
      mkdir -p $out/share/themes
      tar -xzf $src -C $out/share/themes
    '';

    meta = with lib; {
      description = "kali-themes for XFCE4";
      homepage = "https://github.com/Dammratta-GNU/NixOS";
      license = licenses.gpl3;
      platforms = platforms.all;
    };
  };
in
{
  environment.systemPackages = [ kali-themes ];

}
