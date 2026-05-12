local assets=
{
    Asset("ANIM", "anim/hat_helmetbl.zip"),
	Asset("IMAGE", "images/inventoryimages/hat_helmetbl.tex"),	
    Asset("ATLAS", "images/inventoryimages/hat_helmetbl.xml")
}

local function onequip(inst, owner) 
        owner.AnimState:OverrideSymbol("swap_hat", "hat_helmetbl", "swap_hat")
        owner.AnimState:Show("HAT")
        owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
        
        if owner:HasTag("player") then
			owner.AnimState:Hide("HEAD")
			owner.AnimState:Show("HEAD_HAT")
		end
end

local function onunequip(inst, owner) 
        owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

		if owner:HasTag("player") then
	        owner.AnimState:Show("HEAD")
			owner.AnimState:Hide("HEAD_HAT")
		end

        -- opentop_onequip(inst, owner)
        -- owner.DynamicShadow:SetSize(2.2, 1.4)
end


local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst) 
    
    inst.AnimState:SetBank("strawhat")
    inst.AnimState:SetBuild("hat_helmetbl")
    inst.AnimState:PlayAnimation("anim")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("hat")
	
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "hat_helmetbl"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hat_helmetbl.xml"

    inst:AddComponent("equippable")
    --inst.components.equippable.restrictedtag = "mordred"
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

    inst:AddComponent("armor")
	inst.components.armor:InitCondition(TUNING.HAT_HELMETBL_DUR, TUNING.HAT_HELMETBL_ABS)

    -- inst:AddComponent("perishable")
	-- inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
	-- inst.components.perishable:StartPerishing()
    -- inst.components.perishable:SetOnPerishFn(inst.Remove)
	
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_ABSOLUTE)
    
    return inst
end

return Prefab( "common/inventory/hat_helmetbl", fn, assets) 
