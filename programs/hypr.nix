{hyprland,pkgs,...}:{

home.packages = with pkgs; [
 waybar
 swww
];

wayland.windowManager.hyprland = {
 enable = true;
 systemd.enable = true;
 extraConfig = ''
 $terminal = alacritty
 $file-manager = thunar

 monitor=HDMI-A-1,disable

 exec systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
 exec dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
 exec-once = $terminal
 exec-once = waybar
 exec-once = wl-clipboard-history -t
 exec-once = nm-applet
 exec-once = wl-paste --type image --watch cliphist store
 exec-once = wl-paste --type text --watch cliphist store
 $mainMod = SUPER
 bind = $mainMod, Q, exec, $terminal
 bind = $mainMod, C, killactive
 bind = $mainMod, M, exit
 bind = $mainMod, h, movefocus, l
 bind = $mainMod, l, movefocus, r
 bind = $mainMod, j, movefocus, u
 bind = $mainMod, k, movefocus, d

 bind = $mainMod, 1, workspace, 1
 bind = $mainMod, 2, workspace, 2
 bind = $mainMod, 3, workspace, 3

 bind = $mainMod SHIFT, 1, movetoworkspace, 1
 bind = $mainMod SHIFT, 2, movetoworkspace, 2
 bind = $mainMod SHIFT, 3, movetoworkspace, 3
 bind = $mainMod, Space, togglefloating
 bind = $mainMod, S, togglesplit
 bind = $mainMod, P, pseudo
 bind = $mainMod, F, fullscreen
 
 bind = $mainMod, R, exec,wofi --dmenu
 bind = $mainMod, E, exec,$file-manager

 bindm = $mainMod, mouse:272, movewindow
 bindm = $mainMod, mouse:273, resizewindow
 windowrulev2 = float, class:($file-manager)

 general {
  gaps_in = 3
  gaps_out = 6
  border_size = 1
  no_border_on_floating=true
 }

 decoration {
    rounding = 5

    active_opacity = 1.0
    inactive_opacity = 0.95
    fullscreen_opacity = 1.0

    drop_shadow = false

    blur {
       enabled = true
       size = 2
       passes = 2
       new_optimizations = true
    }
 }

 animations {
  enabled = true
 }

 input {
     touchpad {
         natural_scroll = true
     }
 }
 misc {
  disable_hyprland_logo = true
 }
'';
};

}
