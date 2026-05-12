local assets =
{
	Asset( "ANIM", "anim/mordred.zip" ),
	Asset( "ANIM", "anim/ghost_mordred_build.zip" ),
}

local skins =
{
	normal_skin = "mordred",
	ghost_skin = "ghost_mordred_build",
}

return CreatePrefabSkin("mordred_none",
{
	base_prefab = "mordred",
	type = "base",
	assets = assets,
	skins = skins, 
	skin_tags = {"MORDRED", "CHARACTER", "BASE"},
	build_name_override = "mordred",
	rarity = "Character",
})