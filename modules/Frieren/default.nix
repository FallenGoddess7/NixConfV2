{ config, lib, pkgs, ... }:
{
    imports = [
        ../common
        ./boot.nix
        ./fonts.nix
        ./programs.nix
        ./services.nix
    ];
}
