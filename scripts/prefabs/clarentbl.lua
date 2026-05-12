
local assets=

{ 

    Asset("ANIM", "anim/clarentbl.zip"), 
    Asset("ANIM", "anim/swap_clarentbl.zip"),  

    Asset("ATLAS", "images/inventoryimages/clarentbl.xml"), 
    Asset("IMAGE", "images/inventoryimages/clarentbl.tex"), 
	
}

local prefabs = {}

local function IsValidVictim(victim)

    return victim ~= nil
	
        and not (victim:HasTag("veggie") or
		
                victim:HasTag("structure") or
				
                victim:HasTag("wall"))
				
        and victim.components.health ~= nil
		
        and victim.components.combat ~= nil
		
end

local function onattack(inst, attacker, target)

        if not target:IsValid() then
            return
         end
		if target.components.combat ~= nil then
			target.components.combat:SuggestTarget(attacker)
		end
	
		if target.components.sleeper ~= nil and target.components.sleeper:IsAsleep() then
			target.components.sleeper:WakeUp()
		end
	
        local pos = target:GetPosition()
        local sword_thud =SpawnPrefab("groundpound_fx")
        sword_thud.Transform:SetPosition(pos.x, pos.y, pos.z)
        sword_thud.Transform:SetScale(0.8,0.8,0.8)
        local sword_thud2 =SpawnPrefab("groundpoundring_fx")
        sword_thud2.Transform:SetPosition(pos.x, pos.y, pos.z)
        sword_thud2.Transform:SetScale(0.5,0.5,0.5)
    
	end

local function fn()

    local function OnEquip(inst, owner)
        owner.components.combat.areahitrange=TUNING.CLARENTBL_AOE_RNG
        owner.AnimState:OverrideSymbol("swap_object", "swap_clarentbl", "swap_clarentbl")
        owner.AnimState:Show("ARM_carry") 
        owner.AnimState:Hide("ARM_normal") 
		
    end

    local function OnUnequip(inst, owner) 
        owner.components.combat.areahitrange=nil
        owner.AnimState:Hide("ARM_carry") 
        owner.AnimState:Show("ARM_normal") 
		
    end

	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()	
	inst.entity:SetPristine()

	MakeInventoryPhysics(inst)
    MakeHauntableLaunch(inst)
	
    anim:SetBank("clarentbl")
    anim:SetBuild("clarentbl")
    anim:PlayAnimation("idle")
	
	if not TheWorld.ismastersim then
      
	return inst
	  
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetOnAttack(onattack)
    inst.components.weapon:SetDamage(TUNING.CLARENTBL_DMG)
	inst.components.weapon:SetRange(TUNING.CLARENTBL_RNG)

    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.CHOP)
    --inst.components.tool:SetAction(ACTIONS.MINE)
    --inst.components.tool:SetAction(ACTIONS.HAMMER)
    --inst.components.tool:SetAction(ACTIONS.DIG)
    --inst.components.tool:SetAction(ACTIONS.HACK)
    
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	inst:AddComponent("tradable")
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

    --inst.components.finiteuses:SetMaxUses(TUNING.CLARENT_USES)
	--inst.components.finiteuses:SetUses(TUNING.CLARENT_USES)
	--inst.components.finiteuses:SetOnFinished(inst.Remove)


    -- inst:AddComponent("perishable")
	-- inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
	-- inst.components.perishable:StartPerishing()
    -- inst.components.perishable:SetOnPerishFn(inst.Remove)

	inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "clarentbl"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/clarentbl.xml"
	
	inst:ListenForEvent("equip", function(inst, data) onequip(inst, data) end)
	inst:ListenForEvent("unequip", function(inst, data) onunequip(inst, data) end)
	
    return inst

end

return  Prefab("common/inventory/clarentbl", fn, assets, prefabs)

