-- Do aliase stuff
local modpath = minetest.get_modpath("halloween")
dofile(modpath .. "/aliases.lua")

-- Costumes
-- Original Skin Texture Credit: Original skin authors (whoever they may be)

local costume = {}

local level = 0
local heal = 0
local use = 0
local fire = 0
local water = 0
local radiation = 0
local wear = 0

-- Function for registering suits
function costume.register(costume, nodename, original_def)
	minetest.register_tool("halloween:suit_"..nodename, {
		description = costume.." Costume",
		inventory_image = "inv_suit_"..nodename..".png",
		groups = {
			armor_head = level,
			armor_torso = level,
			armor_legs = level,
			armor_feet = level,
			armor_heal = heal,
			armor_use = use,
			armor_fire = fire,
			armor_water = water,
			armor_radiation = radiation,
		},
		wear = 0,
	})
end

-- Register Costumes
costume.register("Devil (Female)", "devil_fe")
costume.register("Devil (Male)", "devil_ma")
costume.register("Dinosaur", "dino")
costume.register("Frankenstein", "frank")
costume.register("Ghost", "ghost")
costume.register("Grim Reaper", "reaper")
costume.register("Killer", "killer")
costume.register("Glow-in-the-dark Skeleton", "skeleton")
costume.register("Unicorn", "unicorn")
costume.register("Vampire", "vampire")
costume.register("Wearwolf", "wearwolf")

-- Other Apparel
minetest.register_tool("halloween:helmet_pumpkin_mask", {
		description = "Pumpkin Mask",
		inventory_image = "inv_helmet_pumpkin_mask.png",
		groups = {
			armor_head = level,
			armor_heal = heal,
			armor_use = use,
		},
		wear = 0,
})

minetest.register_tool("halloween:chestplate_halloween_hoodie", {
		description = "Halloween Hoodie",
		inventory_image = "inv_chestplate_halloween_hoodie.png",
		groups = {
			armor_torso = level, 
			armor_heal = level, 
			armor_use = use,
		},
		wear = 0,
})

-- Candy

minetest.register_craftitem("halloween:caramelized_sugar", {
    description = "Caramelized Sugar",
    inventory_image = "caramelized_sugar.png",
})

minetest.register_craft({
    type = "cooking",
    output = "halloween:caramelized_sugar",
    recipe = "farming:sugar",
    cooktime = 14,
})

minetest.register_craftitem("halloween:candycorn", {
    description = "Candycorn",
    inventory_image = "candycorn.png",
    on_use = minetest.item_eat(3),
})

minetest.register_craft({
    type = "shapeless",
    output = "halloween:candycorn 3",
    recipe = {"halloween:caramelized_sugar", "dye:orange", "dye:yellow", "dye:white"},
})

minetest.register_craftitem("halloween:halloween_chocolate", {
    description = "Halloween Chocolate",
    inventory_image = "halloween_chocolate.png",
    on_use = minetest.item_eat(5),
})

minetest.register_craft({
    type = "shapeless",
    output = "halloween:halloween_chocolate",
    recipe = {"halloween:caramelized_sugar", "farming:chocolate_dark", "dye:orange", "default:paper"},
})

minetest.register_craftitem("halloween:lolipop", {
	description = "Lolipop",
	inventory_image = "lolipop.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "halloween:lolipop 2",
	recipe = {
		{"", "dye:orange", ""},
		{"default:paper", "halloween:caramelized_sugar", "default:paper"},
		{"", "default:stick", ""},
	},
})

minetest.register_craftitem("halloween:caramel_apple", {
	description = "Caramel Apple",
	inventory_image = "caramel_apple.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	output = "halloween:caramel_apple",
	recipe = {
		{"halloween:caramelized_sugar"},
		{"default:apple"},
		{ "default:stick",},
	},
})
