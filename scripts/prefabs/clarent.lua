
local assets=

{ 

    Asset("ANIM", "anim/clarent.zip"), 
    Asset("ANIM", "anim/swap_clarent.zip"),  

    Asset("ATLAS", "images/inventoryimages/clarent.xml"), 
    Asset("IMAGE", "images/inventoryimages/clarent.tex"), 
	
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
end

local function fn()

    local function OnEquip(inst, owner)
	
        owner.AnimState:OverrideSymbol("swap_object", "swap_clarent", "swap_clarent")
		
        owner.AnimState:Show("ARM_carry") 
        owner.AnimState:Hide("ARM_normal") 
		
    end

    local function OnUnequip(inst, owner) 
	
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
	
    anim:SetBank("clarent")
    anim:SetBuild("clarent")
    anim:PlayAnimation("idle")
	
    inst:AddTag("sharp")
    --inst:AddTag("show_spoilage")
	--inst:AddTag("icebox_valid")

	if not TheWorld.ismastersim then
      
	return inst
	  
    end
    
	inst:AddComponent("weapon")
    inst.components.weapon:SetOnAttack(onattack)
    inst.components.weapon:SetDamage(TUNING.CLARENT_DMG)
	inst.components.weapon:SetRange(TUNING.CLARENT_RNG)
    
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	inst:AddComponent("tradable")
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

    --inst.components.finiteuses:SetMaxUses(TUNING.CLARENT_USES)
	--inst.components.finiteuses:SetUses(TUNING.CLARENT_USES)
	--inst.components.finiteuses:SetOnFinished(inst.Remove)


    --inst:AddComponent("perishable")
	--inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
	--inst.components.perishable:StartPerishing()
    --inst.components.perishable:SetOnPerishFn(inst.Remove)

	inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "clarent"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/clarent.xml"

    
	
	inst:ListenForEvent("equip", function(inst, data) onequip(inst, data) end)
	inst:ListenForEvent("unequip", function(inst, data) onunequip(inst, data) end)
	
    return inst
	
end

return  Prefab("common/inventory/clarent", fn, assets, prefabs)

