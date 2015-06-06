/*EquipmentFactory
	var/name
	var/class
	var/attackModifier, defenseModifier
	var/typing, element
	var/prefix, suffix
	var/equipmentNum

	New()
		var/equipment = pick("Weapon","Armor")
		if(prob(10)) equipment = "Accessory"

		switch(equipment)
			if("Weapon") createWeapon()
			if("Armor") createArmor()
			if("Accesory") createAccessory()

	proc
		createWeapon()
			new/Equipment(src.class)

		addWeaponModifiers()
			if(prob(95))
				prefix = pick("Wooden","One-Handed","Common","Rusty","Dull","Weak")
				attackModifier += 2
			if(prob(30) && !prefix)
				prefix = pick("Steel","Two-Handed","Great","Shiny","Bastard","Jagged")
				attackModifier += 4
			if(prob(18) && !prefix)
				prefix = pick("Samurai","Diamond","Amazing","Glowing")
				attackModifier += 6
			if(prob(7) && !prefix)
				prefix = pick("Phoenix","Demonic","Angelic","Dragon","Deadly")
				attackModifier += 10
			if(prob(1) && !prefix)
				prefix = pick("Godly","Seraphim","Omega","Colossal")
				attackModifier += 20

			if(prob(95))
				suffix = pick("Common","Rusty","Weakness")
				attackModifier += 2
			if(prob(30) && !suffix)
				suffix = pick("Magic","Mystery","Darkness","Casting")
				attackModifier += 4
			if(prob(18) && !suffix)
				suffix = pick("Destruction","Death","Doom","Light")
				attackModifier += 6
			if(prob(7) && !suffix)
				suffix = pick("Apocalypto","Burning","Hell")
				attackModifier += 10
			if(prob(1) && !suffix)
				suffix = pick("Gods","Creation","Grandness")
				attackModifier += 20

			if(prefix && suffix)
				name = "[prefix] [name] of [suffix]"
			else if(prefix && !suffix)
				name = "[prefix] [name]"
			else if(!prefix && suffix)
				name = "[name] of [suffix]"

		createArmor()

		addArmorModifiers()
			if(prob(95))
				prefix = pick("Ragged","Common","Rusty","Weak")
				defenseModifier += 0.5
			if(prob(30) && !prefix)
				prefix = pick("Metal","Enchanted","Heavy","Protective")
				defenseModifier += 1
			if(prob(18) && !prefix)
				prefix = pick("Mysterious","Strong","Valiant","Savage","Meteoric")
				defenseModifier += 1.75
			if(prob(7) && !prefix)
				prefix = pick("Wyrm's","Blessed","Champion's","Exotic","Deadly")
				defenseModifier += 2.75
			if(prob(1) && !prefix)
				prefix = pick("Arch-Angel's","Seraphim","Omega","Master's")
				defenseModifier += 4

			if(prob(95))
				suffix = pick("Common","Rust","Weakness")
				defenseModifier += 0.5
			if(prob(30) && !suffix)
				suffix = pick("Magic","Mystery","Darkness","Casting","Swiftness","Balance")
				defenseModifier += 1
			if(prob(18) && !suffix)
				suffix = pick("Power","Might","Proection","Light","Brilliance")
				defenseModifier += 1.75
			if(prob(7) && !suffix)
				suffix = pick("the Giants","Harmony","Gore","Lightning","the Mammoth")
				defenseModifier += 2.75
			if(prob(1) && !suffix)
				suffix = pick("Gods","Creation","Champions","Grandness")
				defenseModifier += 4

			if(prefix && suffix)
				name = "[prefix] [name] of [suffix]"
			else if(prefix && !suffix)
				name = "[prefix] [name]"
			else if(!prefix && suffix)
				name = "[name] of [suffix]"

		createAccessory()*/

Equipment
	Ruler
		name = "Ruler"
		attackModifier = 1
		equipmentNum = 1
	beginnerHat
		name = "Beginner Hat"
		defenseModifier = 1
		equipmentNum = 2

	var/equipmentType
	var/attackModifier
	var/defenseModifier
	var/name
	var/class
	var/equipmentNum

	New(var/playerClass)
		class = playerClass
		pickType()

	proc
		returnNum()
			return equipmentNum
		returnName()
			return name
		returnStats()
			if(attackModifier) return attackModifier
			else return defenseModifier

		pickType()
			var/equipment = pick("Weapon","Armor")
			if(prob(10)) equipment = "Accessory"

			switch(equipment)
				if("Weapon") equipmentType = "weapon"
				if("Armor") equipmentType = "armor"
				if("Accesory") equipmentType = "accessory"

			createEquipment()

		createEquipment()
			switch(equipmentType)
				if("weapon")
					equipmentNum = 1
					attackModifier = 3

					if(class == "Soldier") name = pick("Sword","Mace","Flail","Axe")
					if("Thief") name = pick("Claw","Dagger","Shuriken")
					if("Wizard") name = pick("Wand","Staff")


					addWeaponModifiers()

				if("armor")
					var/list/equipment = list("Null","Hat","Gloves","Cape","Top","Bottom","Shoes","Shield")
					equipmentNum = rand(2,8)

					switch(equipment[equipmentNum])
						if("Hat")
							name = pick("Headband","Helmet","Hat","Visor")
							switch(name)
								if("Helmet") defenseModifier = 2
								if("Hat" || "Headband" || "Visor") defenseModifier = 1

						if("Gloves")
							name = pick("Gauntlet","Gloves")
							switch(name)
								if("Gauntlet") defenseModifier = 2
								if("Gloves") defenseModifier = 1

						if("Cape")
							name = pick("Cape","Cloak")
							switch(name)
								if("Cape" || "Cloak") defenseModifier = 1

						if("Top")
							name = pick("Shirt","Chainmail","Full Plate")
							switch(name)
								if("Shirt") defenseModifier = 1
								if("Chainmail" || "Full Plate") defenseModifier = 2

						if("Bottom")
							name = pick("Greaves","Pants")
							switch(name)
								if("Pants") defenseModifier = 1
								if("Greaves") defenseModifier = 2

						if("Shoes")
							name = pick("Sneakers","Sandals","Boots")
							switch(name)
								if("Sneakers" || "Sandals") defenseModifier = 1
								if("Boots") defenseModifier = 2

						if("Shield")
							name = pick("Shield","Fence","Panlid")
							switch(name)
								if("Shield") defenseModifier = 2
								if("Fence" || "Panlid") defenseModifier = 1

					addArmorModifiers()

				if("accessory")
					name = pick("Earrings","Necklace","Rings")
					switch(name)
						if("Earrings")
							name = pick("Earrings")
						if("Necklace")
							name = pick("Necklace")
						if("Rings")
							name = pick("Ring")

		addWeaponModifiers()
			var/prefix
			var/suffix

			if(prob(95))
				prefix = pick("Wooden","One-Handed","Common","Rusty","Dull","Weak")
				attackModifier += 2
			if(prob(30) && !prefix)
				prefix = pick("Steel","Two-Handed","Great","Shiny","Bastard","Jagged")
				attackModifier += 4
			if(prob(18) && !prefix)
				prefix = pick("Samurai","Diamond","Amazing","Glowing")
				attackModifier += 6
			if(prob(7) && !prefix)
				prefix = pick("Phoenix","Demonic","Angelic","Dragon","Deadly")
				attackModifier += 10
			if(prob(1) && !prefix)
				prefix = pick("Godly","Seraphim","Omega","Colossal")
				attackModifier += 20

			if(prob(95))
				suffix = pick("Common","Rusty","Weakness")
				attackModifier += 2
			if(prob(30) && !suffix)
				suffix = pick("Magic","Mystery","Darkness","Casting")
				attackModifier += 4
			if(prob(18) && !suffix)
				suffix = pick("Destruction","Death","Doom","Light")
				attackModifier += 6
			if(prob(7) && !suffix)
				suffix = pick("Apocalypto","Burning","Hell")
				attackModifier += 10
			if(prob(1) && !suffix)
				suffix = pick("Gods","Creation","Grandness")
				attackModifier += 20

			if(prefix && suffix)
				name = "[prefix] [name] of [suffix]"
			else if(prefix && !suffix)
				name = "[prefix] [name]"
			else if(!prefix && suffix)
				name = "[name] of [suffix]"

		addArmorModifiers()
			var/prefix
			var/suffix

			if(prob(95))
				prefix = pick("Ragged","Common","Rusty","Weak")
				defenseModifier += 0.5
			if(prob(30) && !prefix)
				prefix = pick("Metal","Enchanted","Heavy","Protective")
				defenseModifier += 1
			if(prob(18) && !prefix)
				prefix = pick("Mysterious","Strong","Valiant","Savage","Meteoric")
				defenseModifier += 1.75
			if(prob(7) && !prefix)
				prefix = pick("Wyrm's","Blessed","Champion's","Exotic","Deadly")
				defenseModifier += 2.75
			if(prob(1) && !prefix)
				prefix = pick("Arch-Angel's","Seraphim","Omega","Master's")
				defenseModifier += 4

			if(prob(95))
				suffix = pick("Common","Rust","Weakness")
				defenseModifier += 0.5
			if(prob(30) && !suffix)
				suffix = pick("Magic","Mystery","Darkness","Casting","Swiftness","Balance")
				defenseModifier += 1
			if(prob(18) && !suffix)
				suffix = pick("Power","Might","Proection","Light","Brilliance")
				defenseModifier += 1.75
			if(prob(7) && !suffix)
				suffix = pick("the Giants","Harmony","Gore","Lightning","the Mammoth")
				defenseModifier += 2.75
			if(prob(1) && !suffix)
				suffix = pick("Gods","Creation","Champions","Grandness")
				defenseModifier += 4

			if(prefix && suffix)
				name = "[prefix] [name] of [suffix]"
			else if(prefix && !suffix)
				name = "[prefix] [name]"
			else if(!prefix && suffix)
				name = "[name] of [suffix]"


/*
Equipment
	var/name
	var/defenseModifier = 0
	var/attackModifier = 0
	var/class
	var/prefix
	var/suffix
	var/isWeapon = 0
	var/isArmor = 0
	var/isAccessory = 0
	var/armorChoice = 0
	var/mob/player

	New(var/mob/source)
		class = source.class
		player = source

		var/equipment = pick("Weapon","Armor")
		if(prob(10)) equipment = "Accessory"

		switch(equipment)
			if("Weapon") createWeapon()
			if("Armor") createArmor()
			if("Accesory") createAccessory()
		giveEquipment()


	proc
		createWeapon()
			isWeapon = 1
			if(class == "Soldier")
				name = pick("Sword","Mace","Flail","Axe")
				attackModifier = 3
			if("Thief")
				name = pick("Claw","Dagger","Shuriken")
				attackModifier = 3
			if("Wizard")
				name = pick("Wand","Staff")
				attackModifier = 3

			addWeaponPrefix()
			addWeaponSuffix()
			createName()

		createArmor()
			isArmor = 1

			var/list/equipment = list("Null","Hat","Gloves","Cape","Top","Bottom","Shoes","Shield")
			armorChoice = rand(2,8)

			switch(equipment[armorChoice])
				if("Hat")
					name = pick("Headband","Helmet","Hat","Visor")
					switch(name)
						if("Helmet")
							defenseModifier = 2
						if("Hat" || "Headband" || "Visor")
							defenseModifier = 1

				if("Gloves")
					name = pick("Gauntlet","Gloves")
					switch(name)
						if("Gauntlet")
							defenseModifier = 2
						if("Gloves")
							defenseModifier = 1

				if("Cape")
					name = pick("Cape","Cloak")
					switch(name)
						if("Cape" || "Cloak")
							defenseModifier = 1

				if("Top")
					name = pick("Shirt","Chainmail","Full Plate")
					switch(name)
						if("Shirt")
							defenseModifier = 1
						if("Chainmail" || "Full Plate")
							defenseModifier = 2

				if("Bottom")
					name = pick("Greaves","Pants")
					switch(name)
						if("Pants")
							defenseModifier = 1
						if("Greaves")
							defenseModifier = 2

				if("Shoes")
					name = pick("Sneakers","Sandals","Boots")
					switch(name)
						if("Sneakers" || "Sandals")
							defenseModifier = 1
						if("Boots")
							defenseModifier = 2

				if("Shield")
					name = pick("Shield","Fence","Panlid")
					switch(name)
						if("Shield")
							defenseModifier = 2
						if("Fence" || "Panlid")
							defenseModifier = 1

			addArmorPrefix()
			addArmorSuffix()
			createName()

		createAccessory()
			name = pick("Earrings","Necklace","Rings")
			switch(name)
				if("Earrings")
					name = pick("Earrings")
				if("Necklace")
					name = pick("Necklace")
				if("Rings")
					name = pick("Ring")

		addWeaponPrefix()
			if(prob(95))
				prefix = pick("Wooden","One-Handed","Common","Rusty","Dull","Weak")
				attackModifier += 2
			if(prob(30) && !prefix)
				prefix = pick("Steel","Two-Handed","Great","Shiny","Bastard","Jagged")
				attackModifier += 4
			if(prob(18) && !prefix)
				prefix = pick("Samurai","Diamond","Amazing","Glowing")
				attackModifier += 6
			if(prob(7) && !prefix)
				prefix = pick("Phoenix","Demonic","Angelic","Dragon","Deadly")
				attackModifier += 10
			if(prob(1) && !prefix)
				prefix = pick("Godly","Seraphim","Omega","Colossal")
				attackModifier += 20

		addWeaponSuffix()
			if(prob(95))
				suffix = pick("Common","Rusty","Weakness")
				attackModifier += 2
			if(prob(30) && !suffix)
				suffix = pick("Magic","Mystery","Darkness","Casting")
				attackModifier += 4
			if(prob(18) && !suffix)
				suffix = pick("Destruction","Death","Doom","Light")
				attackModifier += 6
			if(prob(7) && !suffix)
				suffix = pick("Apocalypto","Burning","Hell")
				attackModifier += 10
			if(prob(1) && !suffix)
				suffix = pick("Gods","Creation","Grandness")
				attackModifier += 20

		addArmorPrefix()
			if(prob(95))
				prefix = pick("Ragged","Common","Rusty","Weak")
				defenseModifier += 0.5
			if(prob(30) && !prefix)
				prefix = pick("Metal","Enchanted","Heavy","Protective")
				defenseModifier += 1
			if(prob(18) && !prefix)
				prefix = pick("Mysterious","Strong","Valiant","Savage","Meteoric")
				defenseModifier += 1.75
			if(prob(7) && !prefix)
				prefix = pick("Wyrm's","Blessed","Champion's","Exotic","Deadly")
				defenseModifier += 2.75
			if(prob(1) && !prefix)
				prefix = pick("Arch-Angel's","Seraphim","Omega","Master's")
				defenseModifier += 4

		addArmorSuffix()
			if(prob(95))
				suffix = pick("Common","Rust","Weakness")
				defenseModifier += 0.5
			if(prob(30) && !suffix)
				suffix = pick("Magic","Mystery","Darkness","Casting","Swiftness","Balance")
				defenseModifier += 1
			if(prob(18) && !suffix)
				suffix = pick("Power","Might","Proection","Light","Brilliance")
				defenseModifier += 1.75
			if(prob(7) && !suffix)
				suffix = pick("the Giants","Harmony","Gore","Lightning","the Mammoth")
				defenseModifier += 2.75
			if(prob(1) && !suffix)
				suffix = pick("Gods","Creation","Champions","Grandness")
				defenseModifier += 4

		createName()
			if(prefix && suffix)
				name = "[prefix] [name] of [suffix]"
			else if(prefix && !suffix)
				name = "[prefix] [name]"
			else if(!prefix && suffix)
				name = "[name] of [suffix]"
			else
				name = "[name]"

		giveEquipment()
			if(isWeapon)
				if(attackModifier > player.equipment[1])
					if(player.equipment[1])
						world << output("Threw away [player.equipment[1]] with [player.equipment[1]] attack.","Travel")
					player.equipment[1] = name
					world << output("Picked up [player.equipment[1]] with [attackModifier] attack.","Travel")
				else
					world << output("Found [name] with [attackModifier] attack and threw it away.","Travel")
				player.equipment[1] = attackModifier

			if(isArmor)
				if(defenseModifier > player.equipment[armorChoice])
					if(player.equipment[armorChoice])
						world << output("Threw away [player.equipment[armorChoice]] with [player.equipment[armorChoice]] defense.","Travel")
					player.equipment[armorChoice] = name
					world << output("Picked up [player.equipment[armorChoice]] with [defenseModifier] defense.","Travel")
				else
					world << output("Found [name] with [defenseModifier] defense and threw it away.","Travel")
				player.equipment[armorChoice] = defenseModifier

			if(isAccessory) return*/