# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:



let
  extensions = (with pkgs.vscode-extensions; [
      bbenoist.Nix
      ms-python.python
      ms-azuretools.vscode-docker
      eamodio.gitlens
      vscodevim.vim
      editorconfig.editorconfig
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "vscode-language-pack-fr";
      publisher = "MS-CEINTL";
      version = "1.60.4";
      sha256 = "0r6a1v14z5mryrhqwhq9li1xc282x57f75yzbid2z0dnnz3af4yg";
    }
    {
      name = "remote-containers";
      publisher = "ms-vscode-remote";
      version = "0.195.0";
      sha256 = "43c66aa22c6205199c99bbb94ebf9992df2d427524b1fddb3d08f0c163c9332c";
    }
  ];
  vscodium-with-extensions = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscodium;
    vscodeExtensions = extensions;
  };
  cozy-drive = pkgs.callPackage cozy-drive/default.nix {};


in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
    ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "specternixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp108s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };



  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Enable GNOME 3
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "fr";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable docker
  # virtualisation.docker.enable = true;


  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simara = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker"]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    brave
    zsh
    tlp
    spotify
    joplin
    joplin-desktop
    postman
    qgis
    git
    libreoffice
    vscodium-with-extensions
    signal-desktop
    whatsapp-for-linux
    cozy-drive

    # Db Stuff
    dbeaver
    # kde stuff
    # kdeconnect
    # latte-dock
    
    # Gnome stuff
    gnomeExtensions.gsconnect
    gnomeExtensions.topiconsfix
    gnomeExtensions.appindicator
    gnome.gnome-tweak-tool
  ];
  programs.steam.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  #
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
    };
  };

  # List services that you want to enable:
  systemd.services.fixHpSpecter13Sleep = lib.mkIf (config.networking.hostName == "specternixos"){
     wantedBy = [ "multi-user.target" ]; 
     after = [ "network.target" ];
     description = "HP Specter 13: fix";
     serviceConfig = {
       Type = "oneshot";
       ExecStart = "${pkgs.bash}/bin/bash -c 'echo PWRB > /proc/acpi/wakeup'";
       RemainAfterExit = "yes";
     };
   };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # services.tlp.enable = true;

  # Open ports in the firewall.
  # Let some ports open for Kde Connect.
  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}
