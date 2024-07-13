{ config, lib, ... }:
{
        # X11 keymap.
        services.xserver.xkb.layout = lib.mkDefault "us";

        # Time zone.
        time.timeZone = lib.mkDefault "America/Chicago";
        # Whether to use local time or UTC for the hardware clock.
        # Changing this to true allows for compatibility with windows.
        time.hardwareClockInLocalTime = lib.mkDefault false;

        # Localization properties.
        i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";
        i18n.extraLocaleSettings = lib.mkDefault {
                LC_ADDRESS = "en_US.UTF-8";
                LC_IDENTIFICATION = "en_US.UTF-8";
                LC_MEASUREMENT = "en_US.UTF-8";
                LC_MONETARY = "en_US.UTF-8";
                LC_NAME = "en_US.UTF-8";
                LC_NUMERIC = "en_US.UTF-8";
                LC_PAPER = "en_US.UTF-8";
                LC_TELEPHONE = "en_US.UTF-8";
                LC_TIME = "en_US.UTF-8";
        };

        # Set environment variables so that other programs can use the
        # correct localization values.
        environment.variables = {
                TZ = lib.mkDefault "${config.time.timeZone}";
        };
}
