{ config, pkgs, ... }:

{

# ----- Creating Home Environment 

#	home.username = "emettej";
#	home.homeDirectory = "/home/emettej";

	wayland.windowManager.hyprland = {

		enable = true;
		package = null;
		portalPackage = null;
		xwayland.enable = true;

	};

	home.packages = with pkgs; [
	
# ----- Packages Installed (for Hyprland)
		
		dunst
		grim
		grimblast
		kitty
		libnotify
		networkmanagerapplet
		hyprpaper
		hypridle
		hyprlock
		xdg-desktop-portal-hyprland
		hyprcursor
		hyprlang
		rofi
		waybar
		eww

	];

#	programs.home-manager.enable = true;
#	home.stateVersion = "26.05";
}
