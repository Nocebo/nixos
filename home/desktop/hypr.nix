{
  lib,
  config,
  pkgs,
  ...
}: {
  #service.hyprpapaer.enable = true;
  home.packages = with pkgs; [
    waybar # Status bar for Wayland
    # libnotify # Library for sending desktop notifications
    # dunst # Lightweight notification daemon
    # kitty # GPU-based terminal emulator
    # rofi-wayland # Window switcher, frun dialog and dmenu replacement
    # wob # Wayland overlay bar for volume and brightness
    # swww # Fast and simple wallpaper setter for Wayland
    # grim # Screenshot utility for Wayland
    # slurp # Select a region in a Wayland compositor
    # hyprlock
    # hyprgui
    # hyprlauncher
    # hypridle
  ];

  xdg.configFile."hypr/hyprland.conf".source = ../conf/hyprland.conf;

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   #systemd = true;
  #   # Further configuration here
  # };
}
