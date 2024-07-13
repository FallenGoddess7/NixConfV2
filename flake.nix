{
    description = "Fallen's Nixos Configuration Flake";
    
    inputs = {
        # Nixpkgs Unstable for more up to date software.
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        
        # Home manager to configure User home directory.
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follow = "nixpkgs";
        
        # Aylurs Gnome Shell. Usefull utilities to make your own bar and widgets.
        ags.url = "github:Aylur/ags/fc0dc946f5134ec4393e20daf20fdcffacafe4b0";
        ags.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nixpkgs, ags, home-manager }: {
        nixosConfigurations = {
            Frieren = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/Frieren
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.extraSpecialArgs = { inherit inputs; };
                        home-manager.users.fallen = import ./home/Frieren;
                    }
                ];
            };
        };
    };
}
