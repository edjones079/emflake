{ pkgs, ... }:

{
	imports = [
		#./system.nix
		#./hyprland.nix
		./user.nix
	];

}
