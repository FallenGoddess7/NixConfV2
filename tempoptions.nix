environment.sessionVariables = {};

environment.shells = [ pkgs.zsh ];

environment.variables = {};

hardware.acpilight.enable = true; # Enable brightness control. RESEARCH THIS
hardware.brillo.enable = true; # Enable brighness control. RESEARCH THIS

hardware.pulseaudio.enable = false;

hardware.sensor.hddtemp.enable = true;

i18n.inputMethod.enabled = [ "ibus" or "fcitx5" or "hime" ];

i18n.inputMethod.fcitx5 = {};

location.latitude = [-90.0 to 90.0];
location.longitude = [-180.0 to 180.0];
location.provider = ["manual" or "geoclue2"];

networking.useDHCP = true;

networking.useNetworkd = true;

systemd.network.netdevs = true;

networking.wireless.dbusControlled = true;

networking.wireless.iwd.enable = true;

# https://iwd.wiki.kernel.org/networkconfigurationsettings
networking.wireless.iwd.settings = {};

networking.wireless.scanOnLowSignal = true;

powerManagement.enable = true;

powerManagement.cpuFreqGovernor = "performance";

programs.command-not-found.enable = true;

programs.dconf.enable = true;
programs.dconf.packages = [];

programs.gamemode.enable = true;

programs.gnupg.agent.enable = true;

programs.gnupg.agent.pinentryFlavor = "curses";

programs.light.enable = true;

programs.light.brightnessKeys.enable = true;

programs.light.brightnessKeys.step = 5;

programs.nix-index.enable = true;

programs.nix-index.enableZshIntegration = true;

programs.nm-applet.enable = true;

programs.regreet.enable = true; # Look more into this to get it set up.
services.greetd.enable = true;

programs.steam.enable = true;

programs.thefuck.enable = true;

programs.xwayland.enable = true;

programs.zsh.enable = true;
programs.zsh.enableBashCompletion = true;
programs.zsh.enableCompletion = true;
programs.zsh.enableLsColors = true;
programs.zsh.autosuggestions.enable = true;

programs.zsh.ohMyZsh.enable = true;
# Just look up zsh and pull what you need.

qt.enable = true;

security.allowSimultaneousMultithreading = true;

security.pam.enableOTPW = true;

security.pam.services = {};

security.polkit.enable = true;

security.rtkit.enable = true;

security.sudo-rs.enable = true;

services.acpid.enable = true;

services.adguardhome.enable = true; # maybe

services.automatic-timezoned.enable = true;

services.autosuspend.enable = true; # maybe

services.blocky.enable = true; # maybe

services.envfs.enable = true;

services.greetd.enable = true;

services.illum.enable = true; # maybe

services.localtimed.enable = true; # maybe

services.lorri.enable = true; # maybe

services.mpd.enable = true; # look at all the settings and decide what to do.

services.nscd.enable = true;
services.nscd.enableNsncd = true;


services.pipewire.enable = true;
services.pipewire.alsa.enable = true;
services.pipewire.alsa.support32Bit = true;
services.pipewire.audio.enable = true;
services.pipewire.jack.enable = true;
services.pipewire.pulse.enable = true;
services.pipewire.wireplumber.enable = true; # maybe

services.redshift.enable = true; # maybe

services.resolved.enable = true; # look into this and all of its settings.

services.smartd.enable = true;
services.smartd.autodetect = true; # look into all the options and decide what
# all needs to be added and changed.

services.spotifyd.enable = true; # maybe

services.thermald.enable = true;

services.timesyncd.enable = true; # look into options and decide what we need.

services.watchdogd.enable = true; # maybe, look into it and its options.

services.xfs.enable = true; # X Font Server, maybe, look into it and decide.

sound.enable = true; # maybe

sound.extraConfig = ""; # look it up if you decide to use it.

sound.mediaKeys.enable = true;

system.name = "Frieren";

system.nixos.label = ""; # look it up and decide.

system.nixos.release = "24.05";

systemd.extraConfig = "" # look it up and add what you need.

systemd.network.enable = true;
systemd.network.config = {}; # look it up and decide what we need.

systemd.network.wait-online.timeout = 10;
systemd.network.wait-online.anyInterface = true;
systemd.network.wait-online.enable = true;

systemd.services = {}; # figure out what you need here.

users.motd = ""; # maybe, only if we decide not to use a display mangaer.

xdg.autostart.enable = true;

xdg.icons.enable = true;

xdg.menus.enable = true;

xdg.mime.enable = true;

xdg.portal.enable = true;

xdg.portal.config = {}; # look it up and figure it out.

xdg.sounds.enable = true;

# aight now its time to figure out where to put these options whether to use
# them or not and what configuration options need to be set.
