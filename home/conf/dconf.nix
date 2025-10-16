# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.75;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/interface" = {
      #color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [(mkTuple ["xkb" "us"])];
      sources = [(mkTuple ["xkb" "se+nodeadkeys"])];
      xkb-options = ["terminate:ctrl_alt_bksp"];
    };

    "org/gnome/mutter" = {
      edge-tiling = false;
      workspaces-only-on-primary = true;
    };

    "org/gnome/shell" = {
      remember-mount-password = true;
      welcome-dialog-last-shown-version = "47.4";
    };

    "org/gnome/shell/extensions/rounded-window-corners-reborn" = {
      settings-version = mkUint32 7;
    };
  };
}
