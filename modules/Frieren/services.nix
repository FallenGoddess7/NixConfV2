{ config, lib, pkgs, ... }:
{
    # Network
    networking = {
        hostName = mkForce "Frieren";
        firewall.enable = mkForce true;
        firewall.allowPing = mkForce false;
        enableIPv6 = mkForce true;
        useNetworkd = mkForce true;
        nftables.enable = mkForce true;
        networkmanager.enable = mkForce true;
        useDHCP = mkForce true;
        networkmanager.dhcp = mkForce "internal"; # DHCP backend to use.
        wireless.iwd.enable = mkForce true;
        networkmanager.wifi.backend = mkForce "iwd";
        networkmanager.ethernet.macAddress = mkForce "random";
        networkmanager.wifi.macAddress = mkForce "random";
        networkmanager.dns = mkForce "systemd-resolved";
    };
    services.resolved.enable = mkForce true;
    services.resolved.dnsovertls = mkForce "opportunistic";
    services.resolved.fallbackDns = mkForce [
        "1.1.1.1" # CloudFlare IPv4 DNS
        "1.0.0.1" # CloudFlare Fallback IPv4 DNS
        "8.8.8.8" # Google IPv4 DNS
        "8.8.4.4" # Google Fallback IPv4 DNS
        "2606:4700:4700::1111" # CloudFlare IPv6 DNS
        "2606:4700:4700::1001" # CloudFlare Fallback IPv6 DNS
        "2001:4860:4860::8888" # Google IPv6 DNS
        "2001:4860:4860::8844" # Google Fallback IPv6 DNS
    ];
    systemd.services.NetworkManager-wait-online.enable = mkForce false;

    # USB automounting
    services.gvfs.enable = mkForce true;
    services.udisks2.enable = mkForce true;
    services.devmon.enable = mkForce true;
    programs.adb.enable = mkForce true;

    # Printing
    services.printing.enable = mkForce true;
}
