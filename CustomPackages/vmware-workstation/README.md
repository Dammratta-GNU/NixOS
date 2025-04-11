VMware builds for nixOS with a changed bundle file source address. Since broadcom changed the download address and the package is not downloaded from official repositories as of 2025-04-11

How to use:
1. Download custom_vmware.nix file to /etc/nixos
2. Create folder /etc/nixos/vmware
3. Download files from vmware_Х.Х.Х to /etc/nixos/vmware (or you can change the path to another one if you wish)
4. chown -R root:root /etc/nixos/vmware
5. Import custom_vmware.nix into configuration.nix
6. nixos-rebuild switch
