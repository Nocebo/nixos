{ config, pkgs, ... }:{ 
  home.file = {
    "hypr/hyprland.conf".source = ../conf/hyprland.conf;  
};
}