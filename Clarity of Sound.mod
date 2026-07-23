return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`Clarity of Sound` encountered an error loading the Darktide Mod Framework.")

		new_mod("Clarity of Sound", {
			mod_script       = "Clarity of Sound/scripts/mods/Clarity of Sound/Clarity of Sound",
			mod_data         = "Clarity of Sound/scripts/mods/Clarity of Sound/Clarity of Sound_data",
			mod_localization = "Clarity of Sound/scripts/mods/Clarity of Sound/Clarity of Sound_localization",
		})
	end,
	version = "1.4.0",
	packages = {},
}
