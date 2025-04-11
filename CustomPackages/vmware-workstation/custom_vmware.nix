{ config, pkgs, ... }:

let
  customVMware = pkgs.callPackage /etc/nixos/vmware/package.nix {};
in
{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (self: super: {
      vmware-workstation = customVMware;
    })
  ];

  virtualisation.vmware.host.enable = true;
}