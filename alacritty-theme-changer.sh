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

echo "Changing Alacritty theme from $old_theme to $new_theme..."
ALACRITTY_DIR="$HOME/.config/alacritty"
sed -i '' "s/\*$old_theme/\*$new_theme/g" "$ALACRITTY_DIR/colors.yml"

