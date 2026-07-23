local mod = get_mod("Clarity of Sound")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id = "group_skitarius",
				type = "group",
				sub_widgets = {
					{ setting_id = "suppress_shield",          type = "checkbox", default_value = true, title = "suppress_shield",          tooltip = "suppress_shield_tooltip" },
					{ setting_id = "suppress_acd",             type = "checkbox", default_value = true, title = "suppress_acd",             tooltip = "suppress_acd_tooltip" },
					{ setting_id = "suppress_transonic_blade", type = "checkbox", default_value = true, title = "suppress_transonic_blade", tooltip = "suppress_transonic_blade_tooltip" },
					{ setting_id = "suppress_chordclaw",       type = "checkbox", default_value = true, title = "suppress_chordclaw",       tooltip = "suppress_chordclaw_tooltip" },
					{ setting_id = "suppress_skull_aim",       type = "checkbox", default_value = true, title = "suppress_skull_aim",       tooltip = "suppress_skull_aim_tooltip" },
				},
			},
			{
				setting_id = "group_zealot",
				type = "group",
				sub_widgets = {
					{ setting_id = "suppress_thunder_hammer", type = "checkbox", default_value = true, title = "suppress_thunder_hammer", tooltip = "suppress_thunder_hammer_tooltip" },
				},
			},
			{
				setting_id = "group_ogryn",
				type = "group",
				sub_widgets = {
					{ setting_id = "suppress_barrage", type = "checkbox", default_value = true, title = "suppress_barrage", tooltip = "suppress_barrage_tooltip" },
				},
			},
			{
				setting_id = "group_hive_scum",
				type = "group",
				sub_widgets = {
					{ setting_id = "suppress_rampage", type = "checkbox", default_value = true, title = "suppress_rampage", tooltip = "suppress_rampage_tooltip" },
				},
			},
		},
	},
}
