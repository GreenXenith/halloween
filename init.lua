-- Costumes
-- Original Skin Texture Credit: Original skin authors (whoever they may be)

-- Function for registering suits
local function register_costume(costume, nodename, def)

	local gen_prev = "((([combine:16x32:-16,-12=halloween_suit_" .. nodename .. ".png^[mask:mask_chest.png)^([combine:16x32:-36,-8=halloween_suit_" .. nodename .. ".png^[mask:mask_head.png)^([combine:16x32:-44,-12=halloween_suit_" .. nodename .. ".png^[mask:mask_arm.png^[transformFX)^([combine:16x32:-44,-12=halloween_suit_" .. nodename .. ".png^[mask:mask_arm.png)^([combine:16x32:4,0=halloween_suit_" .. nodename .. ".png^[mask:mask_leg.png^[transformFX)^([combine:16x32:4,0=halloween_suit_" .. nodename .. ".png^[mask:mask_leg.png))^[resize:32x64)^[mask:mask_preview.png"

	local grouptypes = {
		["suit"] = {armor_head=1, armor_torso=1, armor_legs=1, armor_feet=1, armor_use=1000},
		["mask"] = {armor_head=1, armor_use=1000},
		["shirt"] = {armor_torso=1, armor_use=1000},
	}

	local function is_type(key)
		return grouptypes[key] ~= nil
	end

	local grouptype = "suit"

	if def then
		if def.type then
			if is_type(def.type) then
				grouptype = def.type
			end
		end
	end

	local armor_groups = grouptypes[grouptype]
	local node_str = grouptype.."_"..nodename

	if def then
		if def.name then
			node_str = def.name
		end
	end

	armor:register_armor("halloween:"..node_str, {
		description = costume,
		inventory_image = "inv_"..grouptype.."_"..nodename..".png",
		groups = armor_groups
	})

	local override_prev = gen_prev
	if def then
		if def.preview then
			override_prev = def.preview
		end
	end

	minetest.override_item("halloween:"..node_str, {
		preview = override_prev
	})
end

-- Register Costumes
register_costume("Devil (Female)", "devil_fe", {
	preview = "((([combine:16x32:-28,-12=halloween_suit_devil_fe.png^[mask:mask_chest.png)^([combine:16x32:-36,-8=halloween_suit_devil_fe.png^[mask:mask_head.png)^([combine:16x32:-48,-12=halloween_suit_devil_fe.png^[mask:mask_arm.png)^([combine:16x32:-48,-12=halloween_suit_devil_fe.png^[mask:mask_arm.png^[transformFX)^([combine:16x32:-52,0=halloween_suit_devil_fe.png^[mask:mask_leg.png^[transformFX)^([combine:16x32:-52,0=halloween_suit_devil_fe.png^[mask:mask_leg.png))^[resize:32x64)^[mask:mask_preview.png"
})
register_costume("Devil (Male)", "devil_ma", {
	preview = "((([combine:16x32:-28,-12=halloween_suit_devil_ma.png^[mask:mask_chest.png)^([combine:16x32:-36,-8=halloween_suit_devil_ma.png^[mask:mask_head.png)^([combine:16x32:-52,-12=halloween_suit_devil_ma.png^[mask:mask_arm.png^[transformFX)^([combine:16x32:-52,-12=halloween_suit_devil_ma.png^[mask:mask_arm.png)^([combine:16x32:4,0=halloween_suit_devil_ma.png^[mask:mask_leg.png^[transformFX)^([combine:16x32:4,0=halloween_suit_devil_ma.png^[mask:mask_leg.png))^[resize:32x64)^[mask:mask_preview.png"
})
register_costume("Dinosaur", "dino")
register_costume("Frankenstein", "frank")
register_costume("Ghost", "ghost")
register_costume("Grim Reaper", "reaper")
register_costume("Killer", "killer")
register_costume("Glow-in-the-dark Skeleton", "skeleton")
register_costume("Unicorn", "unicorn")
register_costume("Vampire", "vampire")
register_costume("Wearwolf", "wearwolf")
register_costume("Pumpkin Mask", "pumpkin", {
	type = "mask",
	preview = "((([combine:16x32:-16,-12=halloween_mask_pumpkin.png^[mask:mask_chest.png)^([combine:16x32:-36,-8=halloween_mask_pumpkin.png^[mask:mask_head.png)^([combine:16x32:-44,-12=halloween_mask_pumpkin.png^[mask:mask_arm.png^[transformFX)^([combine:16x32:-44,-12=halloween_mask_pumpkin.png^[mask:mask_arm.png)^([combine:16x32:4,0=halloween_mask_pumpkin.png^[mask:mask_leg.png^[transformFX)^([combine:16x32:4,0=halloween_mask_pumpkin.png^[mask:mask_leg.png))^[resize:32x64)^[mask:mask_preview.png"
})
register_costume("Halloween Hoodie", "halloween_hoodie", {
	type = "shirt",
	preview = "((([combine:16x32:-28,-12=halloween_shirt_halloween_hoodie.png^[mask:mask_chest.png)^([combine:16x32:-36,-8=halloween_shirt_halloween_hoodie.png^[mask:mask_head.png)^([combine:16x32:-52,-12=halloween_shirt_halloween_hoodie.png^[mask:mask_arm.png^[transformFX)^([combine:16x32:-52,-12=halloween_shirt_halloween_hoodie.png^[mask:mask_arm.png)^([combine:16x32:4,0=halloween_shirt_halloween_hoodie.png^[mask:mask_leg.png^[transformFX)^([combine:16x32:4,0=halloween_shirt_halloween_hoodie.png^[mask:mask_leg.png))^[resize:32x64)^[mask:mask_preview.png"
})
register_costume("Cat Mask", "cat", {
	type = "mask",
	preview = "((([combine:16x32:-16,-12=halloween_mask_cat.png^[mask:mask_chest.png)^([combine:16x32:-36,-8=halloween_mask_cat.png^[mask:mask_head.png)^([combine:16x32:-44,-12=halloween_mask_cat.png^[mask:mask_arm.png^[transformFX)^([combine:16x32:-44,-12=halloween_mask_cat.png^[mask:mask_arm.png)^([combine:16x32:4,0=halloween_mask_cat.png^[mask:mask_leg.png^[transformFX)^([combine:16x32:4,0=halloween_mask_cat.png^[mask:mask_leg.png))^[resize:32x64)^[mask:mask_preview.png"
})

minetest.register_alias("halloween:helmet_pumpkin_mask", "halloween:mask_pumpkin")
minetest.register_alias("halloween:chestplate_halloween_hoodie", "halloween:shirt_halloween_hoodie")

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
