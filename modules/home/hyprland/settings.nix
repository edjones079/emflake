{ ... }:

{

	wayland.windowManager.hyprland.settings = {
		
		mod = { _var = "SUPER"; };
		terminal = { _var = "kitty"; };

		config.input = {

		    kb_layout = "us,de";
		    kb_options = "grp:alt_caps_toggle";

		    follow_mouse = 1;

		};

		config.general = {
			
		    layout = "dwindle";

		    gaps_in = 5;
		    gaps_out = 20;
		    border_size = 2;

		};

		config.decoration = {

		    rounding = 10;

		    shadow = {

			enabled = true;
			range = 4;
			render_power = 3;
			color = "rgba(00000055)";
	
		    };

		    blur = {
			
			enabled = true;
			size = 3;
			passes = 1;

		    };

		};

		config.animations = {

		    enabled = true;

		};

	};

}
