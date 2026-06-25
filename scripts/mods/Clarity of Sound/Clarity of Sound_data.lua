local mod = get_mod("Clarity of Sound")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id = "suppress_shield",
				type = "checkbox",
				default_value = true,
				title = "suppress_shield",
				tooltip = "suppress_shield_tooltip",
			},
			{
				setting_id = "suppress_acd",
				type = "checkbox",
				default_value = true,
				title = "suppress_acd",
				tooltip = "suppress_acd_tooltip",
			},
			{
				setting_id = "suppress_chordclaw",
				type = "checkbox",
				default_value = true,
				title = "suppress_chordclaw",
				tooltip = "suppress_chordclaw_tooltip",
			},
			{
				setting_id = "suppress_skull_aim",
				type = "checkbox",
				default_value = true,
				title = "suppress_skull_aim",
				tooltip = "suppress_skull_aim_tooltip",
			},
		},
	},
}
