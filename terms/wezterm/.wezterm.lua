local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.window_close_confirmation = "NeverPrompt"
config.font = wezterm.font("IosevkaTerm Nerd Font Mono")
config.color_scheme = "catppuccin-mocha"
config.default_domain = "WSL:Ubuntu-22.04"
config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color"
config.window_background_opacity = 0.95
config.prefer_egl = true
config.font_size = 16.0
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- keymaps
config.keys = {
	{
		key = "e",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "9", mods = "CTRL", action = act.PaneSelect },
	{ key = "w", mods = "CTRL", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "Tab", mods = "CTRL", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{
		key = "R",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Renomear aba:",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}
return config
