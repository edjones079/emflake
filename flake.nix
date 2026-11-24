# Flake - An attribute set of inputs / outputs.

{
	description = "EmFlake";

	# Inputs - An nested attribute set that contains key-value pairs of external nix expressions!

	inputs = {

		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

		home-manager = {

			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";

		};

		firefox.url = "github:nix-community/flake-firefox-nightly";
		firefox.inputs.nixpkgs.follows = "nixpkgs";

		hyprland.url = "github:hyprwm/Hyprland";

		rose-pine-hyprcursor = {

			url = "github:ndom91/rose-pine-hyprcursor";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.hyprlang.follows = "hyprland/hyprlang";

		};

		nbfc-linux = {
      
			url = "github:nbfc-linux/nbfc-linux?dir=pkgbuilds/nix";
			inputs.nixpkgs.follows = "nixpkgs";

		};

	};

	# Outputs - A function that takes an attribute set of inputs to build the declared outputs!

	outputs = 
	{ self, nixpkgs, home-manager, hyprland, ... }@inputs: 

	# Define local variables for use in system & user configuration!

	let
		# inherit - Create copy of variables & functions from lib.nix!

		inherit (nixpkgs) lib; # lib = nixpkgs.lib;

		pkgs = import nixpkgs {

			inherit system; # system = system;
			config.allowUnfree = true; # nixpkgs.config.allowUnfree = true;
			overlays = []; # overlays = [];

		};

		username = "emettej";
		system = "x86_64-linux";
  	in
  	{
   		coreModules = {
			
			default = { config, lib, pkgs, ... }:
			{
			    imports = [ (import ./modules/core/default.nix inputs) ];
			};

		};

		homeModules = {
			
			default = { config, lib, pkgs, ... }:
			{
			    imports = [ (import ./modules/home/default.nix inputs) ];
			};

		};

	  	nixosConfigurations = { 

	    		wander = nixpkgs.lib.nixosSystem {
			    inherit system;
	      		    modules = [
	        	        ./hosts/wander/configuration.nix
				home-manager.nixosModules.home-manager {
	          		    home-manager = {
					useGlobalPkgs = true;
	            			useUserPackages = true;
	            			extraSpecialArgs = { inherit inputs; };
                    			users.electrickazoo = import ./hosts/wander/home.nix;
				    };
	        		}
	      		    ];
	      		    specialArgs = { inherit inputs; };
    	   		};

	   		agro = nixpkgs.lib.nixosSystem {
	     		    inherit system;
			    modules = [
				./hosts/agro
				#home-manager.nixosModules.home-manager {
		 		#    home-manager = {
		   		#	useGlobalPkgs = true;
	    	   		#	useUserPackages = true;
	    	   		#	extraSpecialArgs = { inherit inputs; };
	    	   		#	users.emettej = import ./hosts/agro/home.nix;
		 		#    };
	       			#}
			    ];
			    specialArgs = {
				host = "agro";
				inherit self inputs username;
			    };
			};
		};
  	};
}
