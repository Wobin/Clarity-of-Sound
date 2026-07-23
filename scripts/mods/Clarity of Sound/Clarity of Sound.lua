--[[
	Name: Clarity of Sound
	Author: Wobin
	Date: 06/07/2026
	Version: 1.3.0
]]--

local mod = get_mod("Clarity of Sound")
mod.version = "1.3.0"

local Wwise = Wwise
local WwiseWorld = WwiseWorld

local PLAYER_ABILITY  = "player_ability"
local SHIELD_STATE    = "cryptic_shield"
local ACD_STATE       = "cryptic_mechanical"
local ACD_LOOP_EVENT  = "wwise/events/player/play_ability_active_cryptic_precision_stance"
local BLADE_LOOP_EVENT = "wwise/events/weapon/play_transonic_blades_idle_loop"
local CHORDCLAW_ALIAS = "melee_charging"
local SKULL_AIM_ALIAS = "ability_aiming"

local HAMMER_LOOP_EVENT      = "wwise/events/weapon/play_thunder_hammer_powered_loop"
local HAMMER_HUSK_LOOP_EVENT = "wwise/events/weapon/husk_play_thunder_hammer_powered_loop"
local BARRAGE_LOOP_EVENT     = "wwise/events/player/play_ability_ogryn_speshul_ammo"
local RAMPAGE_LOOP_EVENT     = "wwise/events/player/play_player_ability_broker_rage_start"

local suppress_shield          = true
local suppress_acd             = true
local suppress_transonic_blade = true
local suppress_chordclaw       = true
local suppress_skull_aim       = true
local suppress_thunder_hammer  = true
local suppress_barrage         = true
local suppress_rampage         = true

local function refresh_settings()
	suppress_shield          = mod:get("suppress_shield")
	suppress_acd             = mod:get("suppress_acd")
	suppress_transonic_blade = mod:get("suppress_transonic_blade")
	suppress_chordclaw       = mod:get("suppress_chordclaw")
	suppress_skull_aim       = mod:get("suppress_skull_aim")
	suppress_thunder_hammer  = mod:get("suppress_thunder_hammer")
	suppress_barrage         = mod:get("suppress_barrage")
	suppress_rampage         = mod:get("suppress_rampage")
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

	if suppress_transonic_blade and event_name == BLADE_LOOP_EVENT then
		return
	end

	if suppress_thunder_hammer and (event_name == HAMMER_LOOP_EVENT or event_name == HAMMER_HUSK_LOOP_EVENT) then
		return
	end

	if suppress_barrage and event_name == BARRAGE_LOOP_EVENT then
		return
	end

	if suppress_rampage and event_name == RAMPAGE_LOOP_EVENT then
		return
	end

	return func(wwise_world, event_name, ...)
end)

mod:hook("PlayerUnitFxExtension", "run_looping_sound", function(func, self, sound_alias, ...)
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
