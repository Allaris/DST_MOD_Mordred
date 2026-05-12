local assets =
{
    Asset("ANIM", "anim/knightarmorbl.zip"),
	Asset("ATLAS", "images/inventoryimages/knightarmorbl.xml"),
    Asset("IMAGE", "images/inventoryimages/knightarmorbl.tex"),
}

local function OnBlocked(owner) 
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour") 
end

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_body", "knightarmorbl", "swap_body")
    inst:ListenForEvent("blocked", OnBlocked, owner)
end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
    inst:RemoveEventCallback("blocked", OnBlocked, owner)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("knightarmorbl")
    inst.AnimState:SetBuild("knightarmorbl")
    inst.AnimState:PlayAnimation("anim")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddTag("wood")

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "knightarmorbl"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/knightarmorbl.xml"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY

    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("armor")
	inst.components.armor:InitCondition(TUNING.KNIGHTARMORBL_DUR, TUNING.KNIGHTARMORBL_ABS)

    -- inst:AddComponent("perishable")
	-- inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
	-- inst.components.perishable:StartPerishing()
    -- inst.components.perishable:SetOnPerishFn(inst.Remove)
    
    inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(240) --TUNING.INSULATION_SUPERSLOW
	
    --inst:AddComponent("waterproofer")
    --inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL)


    return inst
end

return Prefab("common/inventory/knightarmorbl", fn, assets)