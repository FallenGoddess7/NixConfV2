#  ____   ___   ___ _____
# | __ ) / _ \ / _ \_   _|
# |  _ \| | | | | | || |
# | |_) | |_| | |_| || |
# |____/ \___/ \___/ |_|
# 
{ config, lib, pkgs, ... }:
{
    boot = {
        loader.systemd-boot = {
            # Whether to use systemd.
            enable = mkForce true;
            # Whether the boot image should be editable during start up.
            # Enabling this is a security risk as it allows the possibility
            # for an attacker to gain access to root early in the init process.
            editor = mkForce false;
            # The max number of configurations that should be shown.
            configurationLimit = mkForce 10;
            # Resolution systemd-boot should use.
            consoleMode = mkForce "max";
        };
        loader.efi.canTouchEfiVariables = mkForce true;
        # How long to wait before automaticaly booting the default option.
        loader.timeout = mkForce 10;
        
        # The Kernel that the system should use.
        kernelPackages = mkForce pkgs.linuxPackages_zen;
        # Additional Kernel modules for the system to install.
        kernelModules = [ "xpadneo" ];
        # Kernel modules that should be activated as the system boots.
        initrd.kernelModules = [ "amdgpu" ];
        
        # Silent Boot.
        kernelParams = [
            "quiet"
            "splash"
            "rd.udev.log_level=3"
            "rd.systemd.show_status=false"
            "udev.log_priority=3"
        ];
        # Should Nixos display messages during boot.
        initrd.verbose = mkForce false;
        # Only display warning messages with a priority level equal to or 
        # higher than this option.
        consoleLogLevel = mkForce 0;
        plymouth.enable = mkForce true;
        
        # Whether to use systemd in initrd.
        initrd.systemd.enable = mkForce true;
        
        # Allows system processes to communicate with each other during bootup.
        initrd.systemd.dbus.enable = mkForce true;
        
        # Whether networking should be enabled during boot.
        initrd.network.enable = mkForce true;
        # Required for the above option to function properly.
        # Allow the Ethernet Drivers to be accessable during boot.
        initrd.availableKernelModules = [
            "iwlwifi"
            "r8169"
        ];
        # Whether systemd should access the network during boot.
        initrd.systemd.network.enable = mkForce true;
        # Whether systemd should wait for the network to be available before 
        # continuing the boot up process.
        initrd.systemd.network.wait-online.enable = mkForce false;
        
        # The compressor that should be used to compress the Kernel image.
        initrd.compressor = mkForce "zstd";
        
        # When enabled this prevents the Nix Store from being modified. This 
        # is automaticaly disabled during system rebuilds, or when the system 
        # needs to modify the Nix Store.
        readOnlyNixStore = mkForce true;
        # Whether /tmp should be cleared on boot.
        tmp.cleanOnBoot = mkForce true;
    };
    # How long systemd should wait on processes before continuing to reboot.
    systemd.watchdog.rebootTime = mkForce "10s";
}
