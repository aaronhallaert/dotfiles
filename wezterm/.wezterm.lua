-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

if os.getenv("XDG_CURRENT_DESKTOP") == "Hyprland" then
    config.enable_wayland = false
else
    config.enable_wayland = true
end

config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("JetBrains Mono")
config.enable_tab_bar = false
config.font_size = 11

-- and finally, return the configuration to wezterm
return config
