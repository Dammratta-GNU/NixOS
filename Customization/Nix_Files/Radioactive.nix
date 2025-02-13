{ config, pkgs, lib, ... }:

let
  Radioactive = pkgs.stdenv.mkDerivation rec {
    pname = "Radioactive";
    version = "1.0";

    src = pkgs.fetchurl {
      url = "https://github.com/Dammratta-GNU/NixOS/raw/refs/heads/main/Customization/Resources/Radioactive.tar.gz";
      sha256 = "sha256-8uOWmlhNPV+mbTExghH0ucXVj7BnGi073a5ZHjqA+Us=";
    };

    installPhase = ''
      mkdir -p $out/share/icons
      tar -xzf $src -C $out/share/icons
    '';

    meta = with lib; {
      description = "Radioactive icon theme for XFCE4";
      homepage = "https://github.com/Dammratta-GNU/NixOS";
      license = licenses.gpl3;
      platforms = platforms.all;
    };
  };
in
{
  environment.systemPackages = [ Radioactive ];

}
