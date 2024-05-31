{config, pkgs,inputs,...}:
{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

    programs.xwayland.enable = true;
  programs.hyprland = {
   xwayland.enable = true;
   enable = true;
   package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

}
