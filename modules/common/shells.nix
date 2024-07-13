{ config, lib, pkgs, ... }:
{
    programs.zsh.enable = mkDefault true;
    environment.shells = with pkgs; mkDefault [
        zsh
        bash
    ];

    users.defaultUserShell = mkDefault pkgs.zsh;
}
