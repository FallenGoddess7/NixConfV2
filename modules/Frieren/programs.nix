{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        plasma-pa
        pavucontrol
        openrazer-daemon
        polychromatic
    ];

    programs = {
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewll = true;
        };
    };
    hardware.steam-hardware.enable = true;
}
