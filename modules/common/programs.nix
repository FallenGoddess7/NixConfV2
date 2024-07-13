{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        # Archives.
        zip
        unzip
        xz
        
        # Text editor.
        neovim
        
        # System call monitoring.
        lsof
        ltrace
        strace
        
        # System tools.
        dmidecode # Read into about system as reported by BIOS.
        lm_sensors # For 'sensors' command.
        pciutils # lspci.
        usbutils # lsusb.
        sysstat
        
        # Terminal Utilities.
        eza
        git
        wget
        curl
        gawk
        gnupg
        gnused
        gnutar
        tree
        which
        killall
        htop
    ];

    programs.dconf.enable = true;
}
