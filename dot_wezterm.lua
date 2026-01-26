local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

config.default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe', '-NoLogo' }
config.default_cwd = 'C:\\Users\\richard\\Develop'
config.max_fps = 244

-- Fonts
config.font = wezterm.font { family = 'MesloLGS Nerd Font' }
config.font_rules = {
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = 'VictorMono Nerd Font Mono',
      weight = 'Bold',
      style = 'Italic',
    },
  },
  {
    italic = true,
    intensity = 'Half',
    font = wezterm.font {
      family = 'VictorMono Nerd Font Mono',
      weight = 'DemiBold',
      style = 'Italic',
    },
  },
  {
    italic = true,
    intensity = 'Normal',
    font = wezterm.font {
      family = 'VictorMono Nerd Font Mono',
      style = 'Italic',
    },
  },
}
config.font_size = 10

-- Cursor
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 500
config.animation_fps = 30

-- Window
config.window_decorations = 'RESIZE'
config.initial_cols = 120
config.initial_rows = 28

--  Colors
config.window_background_opacity = 0.9
config.win32_system_backdrop = 'Acrylic'
config.color_scheme = 'catppuccin-mocha'
config.colors = {
  background = '#231e35'
}

config.inactive_pane_hsb = {
  saturation = 0.25,
  brightness = 0.5
}

-- Keybinds
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = '-',  mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = "\\", mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'x',  mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },
  { key = 'z',  mods = 'LEADER', action = act.TogglePaneZoomState },
  { key = 'n',  mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain') },
  { key = '[',  mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = ']',  mods = 'LEADER', action = act.ActivateTabRelative(1) },
  { key = 't',  mods = 'LEADER', action = act.ShowTabNavigator },
}

-- Tabs
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 40

-- Tabline
tabline.setup({
  options = {
    icons_enabled = true,
    theme = 'catppuccin-mocha',
    tabs_enabled = true,
    theme_overrides = {
      normal_mode = {
        a = { bg = '#89b4fa' },
        b = { fg = '#bac2de', bg = '#232128' },
        c = { bg = '#333333' }
      },
      tab = {
        active = { fg = '#090618', bg = '#89b4fa' },
        inactive = { bg = '#333333' }
      }
    },
    section_separators = {
      left = wezterm.nerdfonts.ple_right_half_circle_thick,
      right = wezterm.nerdfonts.ple_left_half_circle_thick,
    },
    component_separators = {
      left = wezterm.nerdfonts.ple_right_half_circle_thin,
      right = wezterm.nerdfonts.ple_left_half_circle_thin,
    },
    tab_separators = {
      left = wezterm.nerdfonts.ple_right_half_circle_thick,
      right = wezterm.nerdfonts.ple_left_half_circle_thick,
    },
  },
  sections = {
    tabline_a = { 'mode' },
    tabline_b = { 'workspace' },
    tabline_c = { ' ' },
    tab_active = {
      { Attribute = { Intensity = 'Bold' } },
      wezterm.nerdfonts.fa_folder_open,
      'index',
      { Attribute = { Italic = true } },
      { 'parent',                          padding = 0 },
      '/',
      { 'cwd',    padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = { 'ram', 'cpu' },
    tabline_y = { 'datetime' },
    tabline_z = { 'domain' },
  },
  extensions = {},
})

return config
