{ config, pkgs, lib, ... }:

{

# ----- Creating Home Environment 

	wayland.windowManager.hyprland = {

		enable = true;
		package = null;
		portalPackage = null;
		systemd.enable = false;
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

# ----- Default Application Variables

	wayland.windowManager.hyprland.settings = {

		"$terminal" = lib.mkDefault "kitty";

	};

}
