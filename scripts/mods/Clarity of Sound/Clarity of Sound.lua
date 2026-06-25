--[[
	Name: Clarity of Sound
	Author: Wobin
	Date: 26/06/2026
	Version: 1.1.0
]]--

local mod = get_mod("Clarity of Sound")
mod.version = "1.1.0"

local Wwise = Wwise
local WwiseWorld = WwiseWorld

local PLAYER_ABILITY  = "player_ability"
local SHIELD_STATE    = "cryptic_shield"
local ACD_STATE       = "cryptic_mechanical"
local ACD_LOOP_EVENT  = "wwise/events/player/play_ability_active_cryptic_precision_stance"
local CHORDCLAW_ALIAS = "melee_charging"
local SKULL_AIM_ALIAS = "ability_aiming"

local suppress_shield    = true
local suppress_acd       = true
local suppress_chordclaw = true
local suppress_skull_aim = true

local function refresh_settings()
	suppress_shield    = mod:get("suppress_shield")
	suppress_acd       = mod:get("suppress_acd")
	suppress_chordclaw = mod:get("suppress_chordclaw")
	suppress_skull_aim = mod:get("suppress_skull_aim")
end

mod:hook(Wwise, "set_state", function(func, group, state, ...)
	if group == PLAYER_ABILITY then
		if suppress_shield and state == SHIELD_STATE then
			return
		end

		if suppress_acd and state == ACD_STATE then
			return
		end
	end

	return func(group, state, ...)
end)

mod:hook(WwiseWorld, "trigger_resource_event", function(func, wwise_world, event_name, ...)
	if suppress_acd and event_name == ACD_LOOP_EVENT then
		return
	end

	return func(wwise_world, event_name, ...)
end)

local PlayerUnitFxExtension = require("scripts/extension_systems/fx/player_unit_fx_extension")

mod:hook(PlayerUnitFxExtension, "run_looping_sound", function(func, self, sound_alias, ...)
	if suppress_chordclaw and sound_alias == CHORDCLAW_ALIAS then
		return
	end

	if suppress_skull_aim and sound_alias == SKULL_AIM_ALIAS then
		return
	end

	return func(self, sound_alias, ...)
end)

mod.on_all_mods_loaded = function()
	refresh_settings()
	mod:info("Clarity of Sound " .. tostring(mod.version) .. " loaded")
end

mod.on_setting_changed = function()
	refresh_settings()
end
