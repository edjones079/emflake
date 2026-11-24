{ inputs, ... }: {

	mkHost = {

		path,
		system ? "x86_64-linux",
		extraModules ? [],
		specialArgs ? {},

	}:

		inputs.nixpkgs.lib.nixosSystem {

			inherit system;
			specialArgs = {
			    inherit inputs;
			    outputs = inputs.self.outputs;
			};
			
			modules = [

			    inputs.home-manager.nixosModules.default
			    ../modules/nixos
			    path
		
			]
			++ extraModules;

		};

}
