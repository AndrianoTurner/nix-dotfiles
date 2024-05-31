{ hyprland,config, pkgs, ... }:

{
  imports = [
   ./programs
  ];
  home.username = "andriano";
  home.homeDirectory = "/home/andriano";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    neofetch
    nnn # terminal file manager

    #hyprland
    cliphist
		wl-clipboard
    networkmanagerapplet
    xfce.thunar
    pipewire
    wireplumber
    polkit-kde-agent
    pavucontrol
   # neovim
    firefox
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "AndrianoTurner";
    userEmail = "danya.shibaev@gmail.com";
    extraConfig = ''
    [safe]
    directory  = /etc/nixos
    ''; 
  };


  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
     enable = true;
     theme = "robbyrussell";
    };
  };
  programs.neovim = {
  enable = true;
  defaultEditor = true;
  extraLuaConfig = ''
  	local opt = vim.opt
	local g = vim.g

	opt.ignorecase = true

	opt.smartcase = true
	opt.showmatch = true
	opt.shiftwidth = 2
	opt.tabstop = 2
	opt.smartindent = true

	opt.splitright = true
	opt.splitbelow = true
	opt.clipboard = 'unnamedplus'
	opt.fixeol = false
	opt.relativenumber = true

  '';

  };
  programs.waybar = {
   enable = true;
   style = ''

   '';
   settings = {
    mainBar = {
    layer = "top";
    position = "top";
    modules-left = ["hyprland/workspaces"];
    modules-right = ["tray" "cpu" "network" "pulseaudio" "battery" "clock"];
    tray = {
     spacing = 10;
    };
    clock = {
    tooltip-format = "{:%d-%m-%Y | %H:%M}";
    format-alt = "{:%d-%m-%Y}";
    format = "{:%a %d-%m-%Y %H:%M}";
    };
    cpu = {
     format = "CPU: {usage}%";
    };
    battery = {
     states = {
         good = 95;
	 warning = 30;
	 critical = 15;
     };
     format = "Bat: {capacity}%";
    };
    network = {
     format-wifi = "wifi: {signalStrength}%";
     format-ethernet = "{ifname}: {ipaddr}/{cidr} ethernet";
     format-disconnected = "No connection";
    };
    pulseaudio = {
     format = "Vol: {volume}%";
     on-click = "pavucontrol";
    };
    };
   };
  };
  services.dunst = {
   enable = true;
  };
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
