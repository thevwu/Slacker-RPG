#include <deadron/characterhandling>
client/base_num_characters_allowed = 50

mob/CreatingCharacter
	Login()
		winshow(src.client, "Subscriber Character Creation", 1)
		src.makingCharacter=1
		src.class = "Soldier"
		src.race = "Human"
		src.alignment = "Good"
		src.mount = "Pony"

		if(client.CheckPassport("14c89270726ea94f"))
			winshow(src, "Ancient", 1)
			winshow(src, "Ranger", 1)
			winshow(src, "Egg", 1)
			subscriber = 1

	verb
		chooseClass(c as text)
			if(c == "Soldier" || c == "Wizard" || c == "Thief")
				src.class = c
				world << "check, class is [src.class]"
			else if(subscriber == 1 && c == "Ranger")
				src.class = c
		chooseRace(r as text)
			if(r == "Human" || r == "Elf" || r == "Orc")
				src.race = r
			else if(subscriber == 1 && r == "Ancient")
				src.race = r
		chooseAlignment(a as text)
			if(a == "Good" || a == "Neutral" || a == "Evil")
				src.alignment = a
		chooseMount(m as text)
			if(m == "Pony" || m == "Chick" || m == "Puppy")
				src.mount = m
			else if(subscriber == 1 && m == "Lizard")
				src.mount = m
		createCharacter()
			if(src.class == "Soldier")
				src.HP += 13
				src.MaxHP += 13
				src.MP += 4
				src.MaxMP += 4
				src.strength += 5
				src.defense += 4
				src.dexterity += 3
				src.intelligence += 1
				src.luck += 2
			else if(src.class == "Wizard")
				src.HP += 5
				src.MaxHP += 5
				src.MP += 13
				src.MaxMP += 13
				src.strength += 3
				src.defense += 2
				src.dexterity += 3
				src.intelligence += 5
				src.luck += 2
			else if(src.class == "Thief")
				src.HP += 11
				src.MaxHP += 11
				src.MP += 6
				src.MaxMP += 6
				src.strength += 3
				src.defense += 2
				src.dexterity += 5
				src.intelligence += 1
				src.luck += 4
			if(src.race == "Human")
				src.HP += 5
				src.MaxHP += 5
				src.MP += 5
				src.MaxMP += 5
				src.strength += 2
				src.defense += 2
				src.dexterity += 2
				src.intelligence += 2
				src.luck += 2
			else if(src.race == "Elf")
				src.HP -= 4
				src.MaxHP -= 4
				src.MP += 8
				src.MaxMP += 8
				src.strength -=2
				src.defense -= 1
				src.dexterity += 5
				src.intelligence += 6
				src.luck += 1
			else if(src.race == "Orc")
				src.HP += 8
				src.MaxHP += 8
				src.MP -= 4
				src.MaxMP -=4
				src.strength += 6
				src.defense += 5
				src.dexterity -= 2
				src.intelligence -= 1
				src.luck += 0

			var/mob/new_mob = new()
			new_mob.name = src.name
			new_mob.race = src.race
			new_mob.class = src.class
			new_mob.HP = src.HP
			new_mob.MaxHP = src.MaxHP
			new_mob.MP = src.MP
			new_mob.MaxMP = src.MaxMP
			new_mob.strength = src.strength
			new_mob.defense = src.defense
			new_mob.dexterity = src.dexterity
			new_mob.intelligence = src.intelligence
			new_mob.luck = src.luck
			new_mob.attackBonus = 1
			new_mob.defenseBonus = 1

			new_mob.level = 1
			new_mob.experience = 0
			new_mob.experienceRequirement = 5
			new_mob.joblevel = 1
			new_mob.level = 1
			new_mob.jobExperience = 0
			new_mob.jobExperienceRequirement = 5

			new_mob.monsterWins = 0
			new_mob.monsterLosses = 0
			new_mob.playerWins = 0
			new_mob.playerDeaths = 0
			new_mob.travelTime = 1000000
			new_mob.playerTime = 250
			new_mob.battleTime = 1
			new_mob.alignment = 0
			new_mob.alignmentNumber = "Neutral"

			new_mob.seconds = 0
			new_mob.minutes = 0
			new_mob.hours = 0
			new_mob.days = 0
			new_mob.weeks = 0
			new_mob.equipment[1] = new/Equipment/Ruler
			new_mob.equipment[2] = new/Equipment/beginnerHat

			winshow(src.client, "Subscriber Character Creation", 0)
			src.client.mob = new_mob  //now, we change the player to this newly defined mob!
			del(src)  //delete the old mob
			usr.client.base_SaveMob()
			usr.makingCharacter = 0