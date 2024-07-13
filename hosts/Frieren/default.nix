{ config, lib, pkgs, home-manager, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../../modules/Frieren
    ];

    # Number of job that can run in parallel, set this equal to the systems
    # number of threads (E.g. 16 for a 7800X3D).
    nix.settings.max-jobs = mkForce 16;

    # Use local time instead of UTC for windows compatibility.
    time.hardwareClockInLocalTime = mkForce true;

    hardware = {
        # Firmware updates to system hardware regardless of license.
        cpu.amd.updateMicrocode = mkForce true;
        enableAllFirmware = mkForce true;
        enableRedistributableFirmware = mkForce true;
        
        # Enables support for keyboards enable with QMK.
        keyboard.qmk.enable = true;

        # Drivers for Razer Hardware and who can start the daemon.
        openrazer.enable = true;
        openrazer.mouseBatteryNotifier = true;
        openrazer.users = [ "fallen" ];
        
        # GPU drivers and software.
        opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bit = true;
            extraPackages = with pkgs; [ amdvlk ];
            extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
        };
        
        # Whether to enable bluetooth or not.
        bluetooth.enable = true;

        # Support for xbox controllers and accesories.
        hardware.xpadneo.enable = true;
    };
    # Firmware updates
    services.fwupd.enable = true;

    system = {
        # Whether to copy the system configuration file located at /etc/nixos/
        copySystemConfiguration = mkForce false;
        # Version of Nixos to interpret the configuration files at. This value 
        # does not need to be changed to update the system, in fact it is 
        # possible to break your config by changing it.Only change this value 
        # once you have verified that your config files are compatible or you 
        # have modified them to be compatible with the new version.
        stateVersion = mkForce "23.11";
    };
}
