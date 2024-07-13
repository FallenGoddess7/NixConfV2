{ lib, pkgs, ... }:
{
    # Disables the useradd, userdel, passwd commands. This makes it so users
    # have to be defined in the NixOS configuration.
    # users.mutableUsers = mkDefault false;
    # Enable this after we figure out agenix or some other secret keeping 
    # service to set a password for the user.
    

    users.defaultUserShell = pkgs.bash;


    users.users.fallen = {
        name = "fallen";
        createHome = true;
        home = "/home/fallen";
        isNormalUser = true;
        description  = "FallenGoddess";
        shell = pkgs.zsh;
        useDefaultShell = false;
        extraGroups = [
            "users"
            "wheel"
            "video"
            "pipewire"
            "networkmanager"
            "adbusers"
            "libvirtd"
        ];
    };

    users.users.root = {
        name = "root";
        description = "root";
        shell = pkgs.zsh;
        useDefaultShell = false;
    };


    # Disable sudo password for user.
    security.sudo.extraConfig = "fallen ALL = NOPASSWD : ALL";
}
