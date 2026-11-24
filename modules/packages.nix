{ pkgs, lib, ... }:

let

	hyprlandPackages = with pkgs; [

		hyprshot
		hyprpicker
		hyprsunshot
		brightnessctl
		pamixer
		playerctl
		gnome-themes-extra
		pavucontrol

	];

	systemPackages = with pkgs; [

		git
		neovim
		libnotify
		nautilus
		clipse
		fd
		curl
		unzip
		wget
		gnumake

	];

	discretionaryPackages = with pkgs; [



	];

	# filteredDiscretionaryPackages = lib.lists.subtractLists exclude_packages discretionaryPackages;
	allSystemPackages = hyprlandPackages ++ systemPackages; # ++ filteredDiscretionaryPackages;

in
{

	systemPackages = allSystemPackages;

	homePackages = with pkgs; [];

}
