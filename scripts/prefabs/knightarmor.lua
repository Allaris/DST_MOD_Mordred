local assets =
{
    Asset("ANIM", "anim/knightarmor.zip"),
	Asset("ATLAS", "images/inventoryimages/knightarmor.xml"),
    Asset("IMAGE", "images/inventoryimages/knightarmor.tex"),
}

local function OnBlocked(owner) 
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour") 
end

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_body", "knightarmor", "swap_body")
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

    inst.AnimState:SetBank("knightarmor")
    inst.AnimState:SetBuild("knightarmor")
    inst.AnimState:PlayAnimation("anim")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddTag("wood")

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "knightarmor"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/knightarmor.xml"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY

    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("armor")
	inst.components.armor:InitCondition(TUNING.KNIGHTARMOR_DUR, TUNING.KNIGHTARMOR_ABS)

    --inst:AddComponent("perishable")
	--inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
	--inst.components.perishable:StartPerishing()
    --inst.components.perishable:SetOnPerishFn(inst.Remove)
	
    --inst:AddComponent("waterproofer")
    --inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL)

    return inst
end

return Prefab("common/inventory/knightarmor", fn, assets)