mob/proc
	levelUp()
		if (src.jobExperience >= src.jobExperienceRequirement)
			src.joblevel ++
			src.jobExperience = 0
			src.jobExperienceRequirement = round(25 + (7 + src.level / 4.5) * src.joblevel ^ 2)

			if(src.joblevel == 50 || src.joblevel == 100)
				src.changeclass()

			src.giveSkills()

		if (src.experienceRequirement <= src.experience)
			src.level ++
			src.experience = 0
			src.experienceRequirement = round(25 + (10 + src.level / 3) * src.level ^ 2)

			src << "<br><font color = red>level Up!  Current level: [src.level]"
			src.giveStats()

	giveStats()
		switch(src.class)
			if("Soldier")
				src.MaxHP += 10
				src.MaxMP += 2
				src.strength += 4
				src.intelligence += 3
				src.dexterity += 3
				src.defense += 4
				src.luck += 2

			if ("Mage")
				src.MaxHP += 5
				src.MaxMP += 10
				src.strength += 2
				src.intelligence += 6
				src.dexterity += 4
				src.defense += 2
				src.luck += 1

			if ("Thief")
				src.MaxHP += 8
				src.MaxMP += 3
				src.strength += 3
				src.intelligence += 3
				src.dexterity += 6
				src.defense += 1
				src.luck += 4
			if ("Dark Knight")
				src.MaxHP += 14
				src.MaxMP += 3
				src.strength += 6
				src.intelligence += 2
				src.dexterity += 3
				src.defense += 4
				src.luck += 2
			if ("Knight")
				src.MaxHP += 13
				src.MaxMP += 4
				src.strength += 6
				src.intelligence += 2
				src.dexterity += 3
				src.defense += 4
				src.luck += 2
			if ("Page")
				src.MaxHP += 11
				src.MaxMP += 2
				src.strength += 5
				src.intelligence += 2
				src.dexterity += 3
				src.defense += 4
				src.luck += 2

			if ("Dark Wizard")
				src.MaxHP += 6
				src.MaxMP += 14
				src.strength += 1
				src.intelligence += 8
				src.dexterity += 4
				src.defense += 3
				src.luck += 1
			if ("Cleric")
				src.MaxHP += 7
				src.MaxMP += 14
				src.strength += 4
				src.intelligence += 6
				src.dexterity += 4
				src.defense += 3
				src.luck += 2
			if ("Devil")
				src.MaxHP += 7
				src.MaxMP += 20
				src.strength += 1
				src.intelligence += 10
				src.dexterity += 4
				src.defense += 1
				src.luck += 1
			if ("Summoner")
				src.MaxHP += 8
				src.MaxMP += 16
				src.strength += 4
				src.intelligence += 7
				src.dexterity += 4
				src.defense += 3
				src.luck += 2
			if ("Sage")
				src.MaxHP += 11
				src.MaxMP += 15
				src.strength += 2
				src.intelligence += 8
				src.dexterity += 3
				src.defense += 3
				src.luck += 3
			if ("Priest")
				src.MaxHP += 8
				src.MaxMP += 17
				src.strength += 5
				src.intelligence += 7
				src.dexterity += 4
				src.defense += 3
				src.luck += 2
			if ("God")
				src.MaxHP += 9
				src.MaxMP += 20
				src.strength += 2
				src.intelligence += 8
				src.dexterity += 3
				src.defense += 2
				src.luck += 1
			if ("Demon Summoner")
				src.MaxHP += 9
				src.MaxMP += 17
				src.strength += 5
				src.intelligence += 7
				src.dexterity += 4
				src.defense += 3
				src.luck += 2
			if ("Elder Sage")
				src.MaxHP += 10
				src.MaxMP += 25
				src.strength += 4
				src.intelligence += 10
				src.dexterity += 4
				src.defense += 4
				src.luck += 3
			if ("Blessed Sage")
				src.MaxHP += 10
				src.MaxMP += 15
				src.strength += 6
				src.intelligence += 7
				src.dexterity += 3
				src.defense += 3
				src.luck += 2
			if ("Thug")
				src.MaxHP += 10
				src.MaxMP += 3
				src.strength += 4
				src.intelligence += 2
				src.dexterity += 7
				src.defense += 1
				src.luck += 5
			if ("Rogue")
				src.MaxHP += 9
				src.MaxMP += 3
				src.strength += 4
				src.intelligence += 2
				src.dexterity += 7
				src.defense += 1
				src.luck += 4
			if ("Swindler")
				src.MaxHP += 10
				src.MaxMP += 3
				src.strength += 4
				src.intelligence += 2
				src.dexterity += 7
				src.defense += 1
				src.luck += 5

	changeclass()
		src << "<font color = red>class level Up!  Current class level: [src.joblevel]"
		src << "<TT>Congratulations on your level Up!  Have fun idling, and remember, add this game to your favorites, and sign up on the forums!"

		if(src.joblevel == 50)
			if(src.alignment >= 50)
				if(src.class == "Mage") src.class = "Cleric"
				if(src.class == "Swordsman") src.class = "Fighter"
				if(src.class == "Thief") src.class = "Bodyguard"

			if(src.alignment <= 49 && src.alignment >= -49)
				if(src.class == "Mage") src.class = "Sage"
				if(src.class == "Swordsman") src.class = "Page"
				if(src.class == "Thief") src.class = "Hitman"

			if(src.alignment <= -50)
				if(src.class == "Mage") src.class = "Wizard"
				if(src.class == "Swordsman") src.class = "Spearman"
				if(src.class == "Thief") src.class = "Rogue"

		else if(src.joblevel == 100)
			if(src.alignment >= 50)
				if(src.class == "Cleric") src.class = "Saint"
				if(src.class == "Sage") src.class = "Summoner"
				if(src.class == "Wizard") src.class = "Sorcerer"

				if(src.class == "Fighter") src.class = "Paladin"
				if(src.class == "Page") src.class = "Templar"
				if(src.class == "Spearman") src.class = "Lancer"

				if(src.class == "Bodyguard") src.class = "Enforcer"
				if(src.class == "Hitman") src.class = "Shadower"
				if(src.class == "Rogue") src.class = "Bandit"

			if(src.alignment <= 49 && src.alignment >= -49)
				if(src.class == "Cleric") src.class = "Archmage"
				if(src.class == "Sage") src.class = "Elder Sage"
				if(src.class == "Wizard") src.class = "Warlock"

				if(src.class == "Fighter") src.class = "Hero"
				if(src.class == "Page") src.class = "Titan"
				if(src.class == "Spearman") src.class = "Dragoon"

				if(src.class == "Bodyguard") src.class = "Champion"
				if(src.class == "Hitman") src.class = "Gunslinger"
				if(src.class == "Rogue") src.class = "Assassin"

			if(src.alignment <= -50)
				if(src.class == "Cleric") src.class = "Fallen"
				if(src.class == "Sage") src.class = "Necromancer"
				if(src.class == "Wizard") src.class = "Chaos"

				if(src.class == "Fighter") src.class = "Fallen Knight"
				if(src.class == "Page") src.class = "Beserker"
				if(src.class == "Spearman") src.class = "Dark Knight"

				if(src.class == "Bodyguard") src.class = "Sentinel"
				if(src.class == "Hitman") src.class = "Ninja"
				if(src.class == "Rogue") src.class = "Night Lord"

		src.joblevel = 1

	giveSkills()
		//give skills here