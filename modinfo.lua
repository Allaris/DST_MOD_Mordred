-- This information tells other players more about the mod
name = "Mordred"
description = "The Knight of Rebellion"
author = "Allaris"
version = "1.2.6" -- This is the version of the template. Change it to your own number.

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = "/files/file/950-extended-sample-character/"

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Compatible with Don't Starve Together
dst_compatible = true

-- Not compatible with Don't Starve
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false

-- Character mods are required by all clients
all_clients_require_mod = true 

icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- The mod's tags displayed on the server list
server_filter_tags = {
"character",
"mordred",
}


local function Header(title)
	return { name = "", label = title, hover = "", options = { {description = "", data = false}, }, default = false, }
end

local function Space()
	return { name = "", label = "", hover = "", options = { {description = "", data = false}, }, default = false, }
end

configuration_options = {

    Header("Stats"),

	{   name = "mordred_health",
        label = "Health 󰀍",
        hover = "Set Value",
        options =
        {
			{description="10", data = 10},	
			{description="20", data = 20},		
			{description="30", data = 30},
			{description="60", data = 60},
            {description="75", data = 75},
			{description="90", data = 90},
            {description="110", data = 110},
            {description="130", data = 130},
            {description="150", data = 150},
            {description="200", data = 200},
			{description="200", data = 200},
			{description="250", data = 250},
			{description="300", data = 300},
			{description="350", data = 350},
			{description="400", data = 400},
			{description="450", data = 450},
			{description="500", data = 500},
        },
        default = 200,
    },

	{   name = "mordred_hunger",
        label = "Hunger 󰀎",
        hover = "Set Value",
        options =
        {
			{description="10", data = 10},	
			{description="20", data = 20},		
			{description="30", data = 30},		
			{description="60", data = 60},
            {description="75", data = 75},
			{description="90", data = 90},
            {description="110", data = 110},
            {description="130", data = 130},
            {description="150", data = 150},
            {description="200", data = 200},
			{description="250", data = 250},
			{description="300", data = 300},
			{description="350", data = 350},
			{description="400", data = 400},
			{description="450", data = 450},
			{description="500", data = 500},			
        },
        default = 200,
    },
	
	{   name = "mordred_sanity",
        label = "Sanity 󰀓",
        hover = "Set Value",
        options =
        {
			{description="10", data = 10},	
			{description="20", data = 20},		
			{description="30", data = 30},		
			{description="60", data = 60},
            {description="75", data = 75},
			{description="90", data = 90},
            {description="110", data = 110},
            {description="130", data = 130},
            {description="150", data = 150},
            {description="200", data = 200},
			{description="250", data = 250},
			{description="300", data = 300},
			{description="350", data = 350},
			{description="400", data = 400},
			{description="450", data = 450},
			{description="500", data = 500},
                   
        },
        default = 150,
    },
	
	{   name = "mordred_hp_regen",
        label = "Hp Regen 󰀒",
        hover = "Set Value",
        options =
        {
			{description="0", data = 0},
			{description="1", data = 1},
			{description="5", data = 5},
			{description="10", data = 10},	
			{description="20", data = 20},		
			{description="30", data = 30},		
			{description="60", data = 60},
            {description="75", data = 75},
			{description="90", data = 90},
            {description="110", data = 110},
            {description="130", data = 130},
            {description="150", data = 150},
            {description="200", data = 200},
			{description="250", data = 250},
			{description="300", data = 300},
			{description="350", data = 350},
			{description="400", data = 400},
			{description="450", data = 450},
			{description="500", data = 500},
                   
        },
        default = 1,
    },
	
	{   name = "mordred_hp_tick",
        label = "Time Interval 󰀔",
        hover = "Set Value",
        options =
        {
			{description="1 sec", data = 1},
			{description="2 sec", data = 2},
			{description="5 sec", data = 5},
			{description="10 sec", data = 10},	
			{description="20 sec", data = 20},		
			{description="30 sec", data = 30},		
			{description="60 sec", data = 60},
			{description="80 sec", data = 80},
            {description="160 sec", data = 160},
            {description="240 sec", data = 240},
            {description="320 sec", data = 320},
            {description="400 sec", data = 400},
			                  
        },
        default = 10,
    },

	Header("Lifesteal"),

	{	name = "mordred_lifesteal",
		label = "Damage 󰀋",
		hover = "Set Value",
		options =
		{	
			{description="0%", data = 0},
			{description="1%", data = 0.01},
			{description="5%", data = 0.05},
			{description="10%", data = 0.1},
			{description="25%", data = 0.25},
			{description="50%", data = 0.5},
			{description="100%", data = 1},
			{description="200%", data = 2},
		},
		default = 0.01,
	},

	

Space(),
	Header("Clarent"),

	{	name = "clarent_damage",
		label = "Damage 󰀋",
		hover = "Set Value",
		options =
		{	
			{description="25", data = 25},
			{description="40", data = 40},
			{description="80", data = 80},
			{description="100", data = 100},
			{description="200", data = 200},
			{description="300", data = 300},
			{description="400", data = 400},
			{description="500", data = 500},
			{description="600", data = 600},
			{description="700", data = 700},
			{description="800", data = 800},
			{description="900", data = 900},
			{description="1000", data = 1000},
			{description="2000", data = 2000},
			{description="10 000", data = 10000},
			{description="100 000", data = 100000},
		},
		default = 25,
	},

	Header("ClarentBL AOE Range"),

	{	name = "clarentbl_aoe_rng",
		label = "AOE Range 󰀋",
		hover = "Set Value",
		options =
		{	
			{description="0", data = 0},
			{description="1", data = 1},
			{description="2", data = 2},
			{description="5", data = 5},
			{description="10", data = 10},
		},
		default = 2,
	}

}
