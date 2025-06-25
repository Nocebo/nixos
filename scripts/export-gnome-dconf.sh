#!/usr/bin/env bash

output_file="./home-manager/conf/dconf.nix"
temp=$(mktemp)
pathrm=""

# Use an array for multiple paths
paths=(
"/org/gnome/desktop/peripherals/keyboard/"
"/org/gnome/desktop/peripherals/mouse/"
"/org/gnome/desktop/peripherals/touchpad/"
"/org/gnome/desktop/interface/"
"/org/gnome/desktop/input-sources/"
"/org/gnome/mutter/"
"/org/gnome/mutter/keybindings/"
"/org/gnome/shell/"
"/org/gnome/shell/extensions/rounded-window-corners-reborn/"
#"/org/gnome/shell/extensions/tilingshell/"
)

# Loop through each path and export the dconf settings
for path in "${paths[@]}"; do
    echo "Processing path: $path"
    temp2=$(mktemp)
    dconf dump "$path" > "$temp2"

    sed '/^$/ {N; s/\n.*//; q;}' "$temp2" >> "$temp"
    rm "$temp2"

    pathrm=$(echo "$path" | sed 's|^/||; s|/$||')
    pathrm="[$pathrm]"

    sed -i "s~\[/\]~$pathrm~g" "$temp"
done

# Convert and clean up
cat "$temp" | dconf2nix > "$output_file"
rm "$temp"
echo "dconf settings exported to $output_file"
