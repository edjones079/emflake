# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’)

{ config, inputs, pkgs, ... }:

{
	
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hyprland.nix
      ./../../modules/core
    ];

  # Bootloader

  boot.loader.systemd-boot.enable = false;

  boot.loader.grub = {

    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;

  };

  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel

  boot.kernelPackages = pkgs.linuxPackages_6_12;
  boot.kernelModules = [ "i2c-dev" "uinput" ];

  # Networking

  networking.hostName = "agro"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.networkmanager.enable = true;

  # Allow unfree packages

  nixpkgs.config.allowUnfree = true;

  #hardware.opentabletdriver.daemon.enable = true;
  #hardware.uinput.enable = true;

  #hardware.bluetooth = {

	#enable = true;
	#powerOnBoot = true;
	#settings = {

		#General = {
		
			#Experimental = true;
			#FastConnectable = true;
	
		#};

		#Policy = {

			#AutoEnable = true;

		#};

	#};

  #};

  # Time Zone

  time.timeZone = "America/Los_Angeles";

  # Internationalisation

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Virtualisation

  #virtualisation.docker.enable = true;
  #virtualisation.docker.rootless.enable = true;
  #virtualisation.docker.rootless.setSocketVariable = true;

  # virtualisation.libvirtd = {

  #	enable = true;

  #	qemu = {

  #		swtpm.enable = true;
  #		ovmf.packages = [ pkgs.OVMFFull.fd ];

  #	};

  # };

  # virtualisation.spiceUSBRedirection.enable = true;

  # users.groups.libvirtd.members = [ "emettej" ];
  # users.groups.kvm.members = [ "emettej" ];


  # Users

  nix.settings.allowed-users = [

  	"root"
	"emettej"

  ];

  nix.settings.trusted-users = [
  	"root"
	"emettej"
  ];

  #users.users."emettej" = {
    #isNormalUser = true;
    #description = "Emette Jones";
    #extraGroups = [ "networkmanager" "wheel" ];
    #packages = with pkgs; [];
  #};

  # Programs

  programs = {
  	dconf.enable = true;
    # foot.enable = true;
    # firefox.enable = true;
    # steam.enable = true;
    #
    #

    # waybar.enable = true;

  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Services

  services.udisks2.enable = true;

  services.getty.autologinUser = "emettej";

  services.displayManager.sddm = {

    enable = true;
    wayland.enable = true;

  };

  environment.variables = {
    WAYLAND_DISPLAY = ":0";
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    git-lfs
    firefox
    hyprland
    kitty
    home-manager

    cron
    hyfetch
    eww
    lshw
    curl
    zip
    unzip
    gnutar

    python313Packages.meson
    python313Packages.cmake
    gnumake
    libgccjit
    gnat15

    cmake
    gcc

    pkg-config
    direnv
    nix-direnv
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

