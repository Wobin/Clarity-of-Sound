--[[
	Name: Clarity of Sound
	Author: Wobin
	Date: 25/06/2026
	Version: 1.0.0
]]--

local mod = get_mod("Clarity of Sound")
mod.version = "1.0.0"

-- The Skitarius Integrated Refraction Emitter (bubble shield) muffles world
-- audio via its camera mood, which calls:
--   Wwise.set_state("player_ability", "cryptic_shield")
-- and resets with Wwise.set_state("player_ability", "none").
-- Swallow only that state-set so the muffle never engages; the shield's own
-- sound, screen FX, and shading bubble (set elsewhere) are left untouched.
local PLAYER_ABILITY = "player_ability"
local SHIELD_STATE = "cryptic_shield"

mod:hook(Wwise, "set_state", function(func, ...)
	local group, state = ...

	if group == PLAYER_ABILITY and state == SHIELD_STATE then
		return -- only "cryptic_shield" is blocked; "none" and all else pass through
	end

	return func(...)
end)

mod.on_all_mods_loaded = function()
	mod:info("Clarity of Sound " .. tostring(mod.version) .. " loaded")
end
