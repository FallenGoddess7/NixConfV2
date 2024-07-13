{ config, lib, pkgs, ... }:
{        
    nix = {
        # Nix package instance to use throughout the system.
        package = mkDefault pkgs.nix;        
        # Check nix.conf for any kind of error not just unknown settings.
        checkAllErrors = mkDefault true;
        # Allow Nix to parse and check the generated nix.conf.
        checkConfig = mkDefault true;
        
        # Binary caches to build packages from if a binary cannot be found in
        # one of the following binary caches then it will build from source.
        settings.substituters = [
            "https://nix-community.cachix.org"
            "https://cache.nixos.org/"
        ];
        
        # Users with extra rights when using the nix daemon.
        # Prefix with @ to specify group (E.g "@wheel").
        settings.trusted-users = mkDefault [
            "root"
            "fallen"
        ];
        
        # Enable Flakes (experimental).
        settings.experimental-features = mkDefault [
            "nix-command"
            "flakes"
        ];
        
        # Nix general settings.
        settings = {                        
            # Whether to warn about dirty Git/Mercurial trees.
            warn-dirty = mkDefault false;    
            # How many lines of the log to output upon build fail.
            log-lines = mkDefault 25;
            # The maximum number of jobs that can run in parallel.
            # "auto" defaults to the amount of available logical
            # cores. However, this should be set to the number of
            # threads the system contains (E.g. 16 for a 7800X3D).
            max-jobs = mkDefault "auto";
            # How many concurrent http connections there can be.
            http-connections = mkDefault 50;
            # Enable http2 support.
            http2 = mkDefault true;
            # How long to wait (in seconds) before timing out a
            # connection that hasn't responded.
            connect-timeout = mkDefault 10;
            # If one cache is unavailable, fall back to another. 
            # If none are available build from source.
            fallback = mkDefault true;
            # If there is duplicate binaries in /nix/store after a 
            # build delete them and symlink to a single binary.
            auto-optimise-store = mkDefault true;
            # System architecture to build for.
            system = mkDefault "x86_64-linux";
        };
        
        gc = {
            # Enable automatic Garbage Collection.
            automatic = mkDefault true;
            # Every Monday @ 00:00:00
            dates = mkDefault "weekly";
            # Run on startup if the system was shutdown at the scheduled
            # date for Garbage Collection.
            persistent = mkDefault true;
            # Only delete entries older than 14 days.
            options = mkDefault "--delete-older-than 14d";
        };
    };

    nixpkgs = {
        # The platform of the system building the configuration.
        hostPlatform = "x86_64";
        # The platform to build the configuration for.
        buildPlatform = "x86_64";
        config = {
            # Whether to allow packages with an Unfree license.
            allowUnfree = mkDefault true;
            # Whether to allow Broken packages.
            allowBroken = mkDefault false;
        };
    };
}
