# Expects first argument to be true or false
# - true means changing theme from light to dark
# - false means changing theme from dark to light

light_theme="gruvbox_material_medium_light"
dark_theme="gruvbox_material_medium_dark"

if [ $1 == "true" ]; then
    new_theme=$dark_theme
    old_theme=$light_theme
else
    new_theme=$light_theme
    old_theme=$dark_theme
fi

ALACRITTY_DIR="$HOME/.config/alacritty"
ALACRITTY_COLORS="$ALACRITTY_DIR/colors.yml"
if [ -f "$ALACRITTY_COLORS" ]; then
    cat "$ALACRITTY_COLORS" | grep "*$old_theme" &> /dev/null
    if [ $? -ne 0 ]; then
        echo "Cannot find *$old_theme in $ALACRITTY_COLORS"
        exit 1
    fi
    echo "Changing Alacritty theme from $old_theme to $new_theme..."
    sed -i '' "s/\*$old_theme/\*$new_theme/g" "$ALACRITTY_COLORS"
else
    echo "$ALACRITTY_COLORS doesn't exist!"
    exit 1
fi

