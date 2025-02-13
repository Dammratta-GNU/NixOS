{ config, pkgs, lib, ... }:

let
  We10X-special = pkgs.stdenv.mkDerivation rec {
    pname = "We10X-special";
    version = "1.0";

    src = pkgs.fetchurl {
      url = "https://github.com/Dammratta-GNU/NixOS/raw/refs/heads/main/Customization/Resources/We10X-special.tar.gz";
      sha256 = "sha256-LFxKRywD4IOBTl5xzLcc/fAYmQnFBfwLZGrrmiJTZcE=";
    };

    sourceRoot = ".";

    installPhase = ''
      mkdir -p $out/share/icons
      tar -xzf $src -C $out/share/icons
    '';

    meta = with lib; {
      description = "We10X-special icon theme for XFCE4";
      homepage = "https://github.com/Dammratta-GNU/NixOS";
      license = licenses.gpl3;
      platforms = platforms.all;
    };
  };
in
{
  environment.systemPackages = [ We10X-special ];

}
