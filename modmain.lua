GetPlayer = GLOBAL.GetPlayer

PrefabFiles = {
	"mordred",
    "mordred_none",
    "clarent",
    "clarentbl",
    "clarentblx",
    "blood",
    "bloodbl",
    "bloodblx",
    "hat_helmet",
    "hat_helmetbl",
    "knightarmor",
    "knightarmorbl",
    
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/mordred.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/mordred.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/mordred.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/mordred.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/mordred_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/mordred_silho.xml" ),

    Asset( "IMAGE", "bigportraits/mordred.tex" ),
    Asset( "ATLAS", "bigportraits/mordred.xml" ),
	
	Asset( "IMAGE", "images/map_icons/mordred.tex" ),
	Asset( "ATLAS", "images/map_icons/mordred.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_mordred.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_mordred.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_mordred.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_mordred.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_mordred.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_mordred.xml" ),
	
	Asset( "IMAGE", "images/names_mordred.tex" ),
    Asset( "ATLAS", "images/names_mordred.xml" ),
	
	Asset( "IMAGE", "images/names_gold_mordred.tex" ),
    Asset( "ATLAS", "images/names_gold_mordred.xml" ),

}
--CONSTANTS
TUNING.CLARENT_USES = 400
TUNING.CLARENT_DMG = GetModConfigData("clarent_damage")
TUNING.CLARENT_RNG = 1.0

TUNING.CLARENTBL_USES = 400
TUNING.CLARENTBL_DMG = 50
TUNING.CLARENTBL_RNG = 1.5
TUNING.CLARENTBL_AOE_RNG = GetModConfigData("clarentbl_aoe_rng")

TUNING.CLARENTBLX_USES = 400
TUNING.CLARENTBLX_DMG = 120
TUNING.CLARENTBLX_RNG = 2.0

TUNING.HAT_HELMET_DUR = 500000
TUNING.HAT_HELMET_ABS = 0.75

TUNING.HAT_HELMETBL_DUR = 1000000
TUNING.HAT_HELMETBL_ABS = 0.85

TUNING.KNIGHTARMOR_DUR = 600000
TUNING.KNIGHTARMOR_ABS = 0.85

TUNING.KNIGHTARMORBL_DUR = 1200000
TUNING.KNIGHTARMORBL_ABS = 0.95

TUNING.MORDRED_LIFESTEAL = GetModConfigData("mordred_lifesteal")

TUNING.MORDRED_HEALTH = GetModConfigData("mordred_health")
TUNING.MORDRED_HUNGER = GetModConfigData("mordred_hunger")
TUNING.MORDRED_SANITY = GetModConfigData("mordred_sanity")

TUNING.MORDRED_HP_REGEN = GetModConfigData("mordred_hp_regen")
TUNING.MORDRED_HP_TICK = GetModConfigData("mordred_hp_tick")

-- TUNING.MORDRED_HEALTH_MAX = 200
-- TUNING.MORDRED_HUNGER_MAX = 150
-- TUNING.MORDRED_SANITY_MAX = 150



AddMinimapAtlas("images/map_icons/mordred.xml")

local STRINGS = GLOBAL.STRINGS
local require = GLOBAL.require
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
-- GetPlayer = GLOBAL.GetPlayer
-- local GetWorld = GLOBAL.GetWorld
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH



    --Recipes 

--Clarent
local clarent = AddRecipe("clarent", 
{Ingredient("blood",1,"images/inventoryimages/blood.xml", 1), Ingredient("redgem", 1), Ingredient("marble", 3)}, 
GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE,  nil, nil, nil, nil, nil,
"images/inventoryimages/clarent.xml")

--Clarent Bl
local clarentbl = AddRecipe("clarentbl", 
{Ingredient("clarent",1,"images/inventoryimages/clarent.xml", 1), Ingredient("bloodbl",1,"images/inventoryimages/bloodbl.xml", 1)}, 
GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE,  nil, nil, nil, nil, nil,
"images/inventoryimages/clarentbl.xml")

--Clarent Blx
local clarentblx = AddRecipe("clarentblx", 
{Ingredient("clarent",1,"images/inventoryimages/clarent.xml", 1), Ingredient("bloodblx",1,"images/inventoryimages/bloodblx.xml", 1)}, 
GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE,  nil, nil, nil, nil, nil,
"images/inventoryimages/clarentblx.xml")

--Helmet
local hat_helmet = AddRecipe("hat_helmet", 
{Ingredient("blood",1,"images/inventoryimages/blood.xml", 1), Ingredient("footballhat", 1)}, 
GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE,  nil, nil, nil, nil, nil,
"images/inventoryimages/hat_helmet.xml")


--Helmet Bl
local hat_helmetbl = AddRecipe("hat_helmetbl", 
{Ingredient("hat_helmet",1,"images/inventoryimages/hat_helmet.xml", 1), Ingredient("bloodbl",1,"images/inventoryimages/bloodbl.xml", 1)}, 
GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE,  nil, nil, nil, nil, nil,
"images/inventoryimages/hat_helmetbl.xml")


--Knightarmor 
local knightarmor = AddRecipe("knightarmor", 
{Ingredient("blood",1,"images/inventoryimages/blood.xml", 1), Ingredient("armormarble", 1)}, 
GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE,  nil, nil, nil, nil, nil,
"images/inventoryimages/knightarmor.xml")


--Knightarmor Bl
local knightarmorbl = AddRecipe("knightarmorbl", 
{Ingredient("knightarmor",1,"images/inventoryimages/knightarmor.xml", 1), Ingredient("bloodbl",1,"images/inventoryimages/bloodbl.xml", 1)}, 
GLOBAL.RECIPETABS.WAR, GLOBAL.TECH.NONE,  nil, nil, nil, nil,  nil,
"images/inventoryimages/knightarmorbl.xml")


STRINGS.NAMES.clarent = "Clarent"
STRINGS.NAMES.CLARENT = "Clarent"
STRINGS.RECIPE_DESC.clarent = "I'm gonna kill Arthur!"
STRINGS.RECIPE_DESC.CLARENT = "I'm gonna kill Arthur!"

STRINGS.NAMES.clarentbl = "Clarent Blood Arthur"
STRINGS.NAMES.CLARENTBL = "Clarent Blood Arthur"
STRINGS.RECIPE_DESC.clarentbl = "Many have died and even more will"
STRINGS.RECIPE_DESC.CLARENTBL = "Many have died ane even more will"

STRINGS.NAMES.clarentblx = "Calibur"
STRINGS.NAMES.CLARENTBLX = "Calibur"
STRINGS.RECIPE_DESC.clarentblx = "Big beasts? More like running pups"
STRINGS.RECIPE_DESC.CLARENTBLX = "Big beasts? More like running pups"

STRINGS.NAMES.hat_helmet = "Knight's Helmet"
STRINGS.NAMES.HAT_HELMET = "Knight's Helmet"
STRINGS.RECIPE_DESC.hat_helmet = "Keep my pretty face safe!"
STRINGS.RECIPE_DESC.HAT_HELMET = "Keep my pretty face safe!"

STRINGS.NAMES.hat_helmetbl = "Secret of Pedigree"
STRINGS.NAMES.HAT_HELMETBL = "Secret of Pedigree"
STRINGS.RECIPE_DESC.hat_helmetbl = "Le Fay? Hmm, sounds familiar"
STRINGS.RECIPE_DESC.HAT_HELMETBL = "Le Fay? Hmm, sounds familiar"

STRINGS.NAMES.knightarmor = "Knight's Armor"
STRINGS.NAMES.KNIGHTARMOR = "Knight's Armor"
STRINGS.RECIPE_DESC.knightarmor = "Casual equipment for someone like you"
STRINGS.RECIPE_DESC.KNIGHTARMOR = "Casual equipment for someone like you"

STRINGS.NAMES.knightarmorbl = "Pendragon's Armor"
STRINGS.NAMES.KNIGHTARMORBL = "Pendragon's Armor"
STRINGS.RECIPE_DESC.knightarmorbl = "Reminds of home"
STRINGS.RECIPE_DESC.KNIGHTARMORBL = "Reminds of home"

--Drop krwi z bosa
local function AddBossLoot(prefab)
    if prefab.components.lootdropper then
        prefab.components.lootdropper:AddChanceLoot('blood',1 )
        prefab.components.lootdropper:AddChanceLoot('bloodbl',0.5 )
        prefab.components.lootdropper:AddChanceLoot('bloodblx',0.1 )
    end
end

AddPrefabPostInit("ancient_herald", AddBossLoot)
AddPrefabPostInit("minotaur", AddBossLoot)
AddPrefabPostInit("antlion", AddBossLoot)
AddPrefabPostInit("beequeen", AddBossLoot)
AddPrefabPostInit("bearger", AddBossLoot)
AddPrefabPostInit("crabking", AddBossLoot)
AddPrefabPostInit("deerclops", AddBossLoot)
AddPrefabPostInit("dragonfly", AddBossLoot)
AddPrefabPostInit("klaus", AddBossLoot)
AddPrefabPostInit("lordfruitfly", AddBossLoot)
AddPrefabPostInit("malbatross", AddBossLoot)
AddPrefabPostInit("stalker", AddBossLoot)
AddPrefabPostInit("stalker_forest", AddBossLoot)
AddPrefabPostInit("stalker_atrium", AddBossLoot)


STRINGS.NAMES.blood = "Blood"
STRINGS.NAMES.BLOOD = "Blood"
STRINGS.RECIPE_DESC.blood = "Blood of Arthur's enemies"
STRINGS.RECIPE_DESC.BLOOD = "Blood of Arthur's enemies"

STRINGS.NAMES.bloodbl = "BloodBL"
STRINGS.NAMES.BLOODBL = "BloodBL"
STRINGS.RECIPE_DESC.bloodbl = "Is that 0+ or 0- ?"
STRINGS.RECIPE_DESC.BLOODBL = "Is that 0+ or 0- ?"

STRINGS.NAMES.bloodblx = "BloodBLX"
STRINGS.NAMES.BLOODBLX = "BloodBLX"
STRINGS.RECIPE_DESC.bloodblx = "That's a rare one"
STRINGS.RECIPE_DESC.BLOODBLX = "That's a rare one"

-- The character select screen lines
STRINGS.CHARACTER_TITLES.mordred = "Saber of RED"
STRINGS.CHARACTER_NAMES.mordred = "Mordred"
STRINGS.CHARACTER_DESCRIPTIONS.mordred = "-Likes cats\n-Eats a lot\n-Good fighter"
STRINGS.CHARACTER_QUOTES.mordred = "\"Why don't I deserve to ba a king?\""


-- Custom speech strings
STRINGS.CHARACTERS.MORDRED = require "speech_mordred"

-- The character's name as appears in-game 
STRINGS.NAMES.mordred = "Mordred"
STRINGS.SKIN_NAMES.mordred_none = "Mordred"

-- The skins shown in the cycle view window on the character select screen.
-- A good place to see what you can put in here is in skinutils.lua, in the function GetSkinModes
local skin_modes = {
    { 
        type = "ghost_skin",
        anim_bank = "ghost",
        idle_anim = "idle", 
        scale = 0.75, 
        offset = { 0, -0.25 } 
    },
}

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("mordred", "FEMALE", skin_modes)


