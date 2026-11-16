{ ... }:

{

	wayland.windowManager.hyprland.settings = {
		
		input = {

		    kb_layout = "us,de";
		    kb_options = "grp:alt_caps_toggle";

		    follow_mouse = 1;

		};

		general = {
			
		    layout = "dwindle";

		    gaps_in = 5;
		    gaps_out = 20;
		    border_size = 2;

		    "col.active_border" = "rgba(33ccffee) rgba(00ff99eee) 45deg";
		    "col.inactive_border" = "rgba(595959aa)";

		};

		decoration = {

		    rounding = 10;

		    shadow = {

			enabled = true;
			range = 4;
			render_power = 3;
			color = "rgba(00000055)";
	
		    };

		    blur = {
			
			enable = true;
			size = 3;
			passes = 1;

		    };

		    animations = {
			enabled = true;
		    };

		};

	};

}
