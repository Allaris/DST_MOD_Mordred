
local assets=

{ 

    Asset("ANIM", "anim/bloodblx.zip"), 
    Asset("ANIM", "anim/swap_bloodblx.zip"),  

    Asset("ATLAS", "images/inventoryimages/bloodblx.xml"), 
    Asset("IMAGE", "images/inventoryimages/bloodblx.tex"), 
	
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
	
        owner.AnimState:OverrideSymbol("swap_object", "swap_bloodblx", "swap_bloodblx")
		
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
	
    anim:SetBank("bloodblx")
    anim:SetBuild("bloodblx")
    anim:PlayAnimation("idle")
	
	if not TheWorld.ismastersim then
      
	return inst
	  
    end
    
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	inst:AddComponent("tradable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "bloodblx"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/bloodblx.xml"
	
	inst:ListenForEvent("equip", function(inst, data) onequip(inst, data) end)
	inst:ListenForEvent("unequip", function(inst, data) onunequip(inst, data) end)

    return inst
	
end

return  Prefab("common/inventory/bloodblx", fn, assets, prefabs)

