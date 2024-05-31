{pkgs,...}:
{
    i18n.defaultLocale = "en_US.UTF-8";

  home-manager.useGlobalPkgs = true;

   environment.systemPackages = with pkgs; [
     vim
     wget
     wayland
     alacritty
     hyprpicker
     hyprpaper
     git
   ];

   nixpkgs.config.allowUnfree = true;
   nix.settings = {
   substituters = ["https://hyprland.cachix.org"];
   trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
   experimental-features = ["nix-command" "flakes" "repl-flake"];
  };
}
