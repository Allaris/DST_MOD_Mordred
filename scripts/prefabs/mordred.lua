local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}


-- Custom starting inventory
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.MORDRED = {
	"clarent"
	
}

local start_inv = {}
for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
    start_inv[string.lower(k)] = v.MORDRED
end
local prefabs = FlattenTree(start_inv, true)

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when not a ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "mordred_speed_mod", 1)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "mordred_speed_mod")
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
    inst:AddTag("mordred_builder")
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "mordred.tex" )
end


-- Sanity od kotów
local function sanityfn(inst)
	local x, y, z = inst.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x, y, z, TUNING.SANITY_EFFECT_RANGE, {"catcoon"})
	local delta = 0
	for k, v in pairs(ents) do
		local distsq = math.max(inst:GetDistanceSqToInst(v), 1)
		delta = delta + TUNING.SANITYAURA_LARGE / distsq
	end
	return delta
end




-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "mordred.tex" )
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- Set starting inventory
    inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
	
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	inst.components.health:SetMaxHealth(TUNING.MORDRED_HEALTH) 
	inst.components.hunger:SetMax(TUNING.MORDRED_HUNGER) 
	inst.components.sanity:SetMax(TUNING.MORDRED_SANITY) 
    inst.components.combat.damagemultiplier = 1.25
	inst.components.hunger.hungerrate = 0.75 * TUNING.WILSON_HUNGER_RATE
	inst.components.sanity.rate_modifier = 0.75

	-- Start health regen
	inst.components.health:StartRegen(TUNING.MORDRED_HP_REGEN, TUNING.MORDRED_HP_TICK)

	-- Damage absorption (optional)
	inst.components.health.absorb = 0.25  

	-- Walkspeed
	inst.components.locomotor.walkspeed = 6

	-- Runspeed
    inst.components.locomotor.runspeed = 8

	inst.OnLoad = onload
	inst.OnNewSpawn = onload

	-- Sanity gain near catcoon
	inst.components.sanity.custom_rate_fn = sanityfn
	
	--Lifesteal
	inst:ListenForEvent("onhitother", function(inst, data)
		-- The data object holds the following variables for you to use:
		-- target, damage, damageresolved, stimuli, weapon, redirected
		-- damageresolved is the actual damage dealt, after going through armor, damage redirection, reflect etc.
		-- redirected is the entity that some damage was redirected to, if any.
		-- I can't remember what stimuli is.
		-- So you can do this to apply 25% life-steal of the damage dealt
		if not inst.components.health:IsDead() then
			inst.components.health:DoDelta(data.damageresolved * TUNING.MORDRED_LIFESTEAL)
		end
	end)
	
end

return MakePlayerCharacter("mordred", prefabs, assets, common_postinit, master_postinit, start_inv)

