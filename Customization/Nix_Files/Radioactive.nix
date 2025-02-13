{ config, pkgs, lib, ... }:

let
  Radioactive = pkgs.stdenv.mkDerivation rec {
    pname = "Radioactive";
    version = "1.0";

    src = pkgs.fetchurl {
      url = "https://github.com/Dammratta-GNU/NixOS/raw/refs/heads/main/Customization/Resources/Radioactive.tar.gz";
      sha256 = "sha256-MszjXdRghB6U+TdGO1BizfRysKCtlC0FrlrljjRMbpw="; # Replace with the actual hash
    };

    installPhase = ''
      mkdir -p $out/share/icons/Radioactive
      tar -xzf $src -C $out/share/icons/Radioactive
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
