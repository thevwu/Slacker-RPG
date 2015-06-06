#define DEBUG
#include <deadron/characterhandling>
var list/players = list()

world
	name = "Slacker RPG"
	hub = "SpikeNeedle.SlackerRPG"
	cache_lifespan = 1
	mob = /mob/CreatingCharacter
	loop_checks=0

mob
	Login()
		updateAll()
		winshow(src, "Main", 1)
		world << "[src] has logged in!"
		src<<{"

<font color=red>Welcome to Slacker RPG!  Type 'help' in the input bar to get a list of commands.
"}

		if(client.CheckPassport("14c89270726ea94f"))
			src<<"You're a subscriber, good job!  Enjoy the extra features."
		else
			src<<"You are not a subscriber, try it for extra content."

	/*	if (src.key == "SpikeNeedle")
			GMlevel = 3
			AddGodVerbs()

		players+=src
		AllProc();*/



		new /Timer(src)
		return ..()

	Logout()
		if(!makingCharacter)
			players-=src
			//Players()
			world << "[src] has logged out!"
			del(src)
		del(src)
		..()

	var	seconds = 0, minutes = 0, days = 0, hours = 0, weeks = 0
	var	battleTime, playerTime, travelTime

	var	experience, experienceRequirement
	var	HP, MP, MaxHP, MaxMP
	var joblevel, jobExperience, jobExperienceRequirement
	var	class, race, mount
	var	strength, defense, intelligence, dexterity, luck, level
	var	list/Skills = new()

	var makingCharacter, subscriber
	var	playerWins,	playerDeaths, monsterWins, monsterLosses
	var	alignment, alignmentNumber, alignmentPreference, alignmentFixed

	var toggleChat = 0, toggleStats = 0, toggleEvents = 0, toggleEquipment = 0, toggleSkills = 0
	var
		outputBox
		player
		monsterOutput

		equipment[8]

		attackBonus
		defenseBonus

		fighting = 0
