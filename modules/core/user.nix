{ pkgs, inputs, username, host, ... }:

{
	# Imports the home-manager input modules defined in EmFlake!
	imports = [ inputs.home-manager.nixosModules.home-manager ];

	home-manager = {

		useGlobalPkgs = true;
		useUserPackages = true;
		extraSpecialArgs = { inherit inputs username host; };

		users.${username} = {
			
			imports = [ ./../home ];
			home.username = "${username}";
			home.homeDirectory = "/home/${username}";
			home.stateVersion = "26.05";
			programs.home-manager.enable = true;

		};

		backupFileExtension = "hm-backup";
	};

	users.users.${username} = {
		
		isNormalUser = true;
		description = "${username}";
		extraGroups = [
			"networkkmanager"
			"wheel"
		];
	}
	
	nix.settings.allowed-user = [ "${username}" ];
}
