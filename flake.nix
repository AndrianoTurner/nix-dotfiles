{
 description = "Andriano's Config";
 inputs = {
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
 };
 outputs = {nixpkgs, home-manager, ...} @ inputs: {
  nixosConfigurations.nixbox = nixpkgs.lib.nixosSystem {
   specialArgs = {inherit inputs;};
   modules = [

      home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.andriano = import ./home.nix;
          }
    ./configuration.nix
    ./hardware-configuration.nix
    ./opengl.nix
    ./sound.nix
    ./hyprland.nix
    ./bootloader.nix
    ./network.nix
    ./users.nix
    ./services.nix
    ./time.nix
    ./system-global.nix
   ];
  };
 };
}
