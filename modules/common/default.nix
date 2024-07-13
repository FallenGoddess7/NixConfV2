{ config, lib, pkgs, ... }:
{
    imports = [
        ./locale.nix
        ./nix.nix
        ./programs.nix
        ./shells.nix
        ./usergroup.nix
    ];

    system = {
        # Whether to copy the system configuration file located at /etc/nixos/
        copySystemConfiguration = mkDefault false;
        # Version of Nixos to interpret the configuration files at. This value
        # does not need to be changed to update the system, in fact is is
        # possible to break your config by changing it. Only change this value
        # once you have verified that your config files are compatible or you
        # have modified them to be compatible with the new version.
        stateVersion = mkDefault "23.11";
    };
}
