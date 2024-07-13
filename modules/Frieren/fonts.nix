{ pkgs, ... }:
{
    fonts = {
        enableDefaultPackages = true;
        fontDir.enable = true;
        
        packages = with pkgs; [
            iosevka
            mononoki
            nerdfonts
            ubuntu_font_family
        ];
        
        fontconfig.defaultFonts = {
            serif = [ "Ubuntu" ];
            sansSerif = [ "Ubuntu" ];
            monospace = [ "mononoki" "Ubuntu" ];
            emoji = [ "Nerd Fonts" ];
        };
    };
}
