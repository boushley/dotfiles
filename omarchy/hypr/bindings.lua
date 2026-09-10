-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Keep Omarchy's SUPER+S scratchpad shortcut and add the grave-key alias.
o.bind("SUPER + GRAVE", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))

o.bind("CTRL + SHIFT + 1", "1Password", { launch = "1password" })

-- Replace Omarchy's fixed scale presets with the values in
-- ~/.config/omarchy/display-scales.json.
hl.unbind("SUPER + SLASH")
hl.unbind("SUPER + ALT + SLASH")
o.bind("SUPER + SLASH", "Monitor scaling up", "omarchy-display-scale-step next")
o.bind("SUPER + ALT + SLASH", "Monitor scaling down", "omarchy-display-scale-step previous")
