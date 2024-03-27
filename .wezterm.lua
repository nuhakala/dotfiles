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

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.85
config.font_size = 14.0
-- Disable ligatures
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.colors = {
  -- Make the selection text color fully transparent.
  -- When fully transparent, the current text color will be used.
  selection_fg = 'none',
  -- Set the selection background color with alpha.
  -- When selection_bg is transparent, it will be alpha blended over
  -- the current cell background color, rather than replace it
  selection_bg = 'rgba(50% 50% 50% 50%)',
}

-- and finally, return the configuration to wezterm
return config
