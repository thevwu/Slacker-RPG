mob/proc
	updateStats(var/text)
		switch(text)
			//make everything labels!
			if("HP")
				winset(src, "Main.HP", "text=[src.HP]/[src.MaxHP]")
			if("MP")
				winset(src, "Main.MP", "text=[src.MP]/[src.MaxMP]")
			if("EXP")
				winset(src, "Main.EXP", "text=[src.experience]/[src.experienceRequirement]")
			if("Strength")
				winset(src, "Main.Strength", "text=[src.strength]")
			if("Defense")
				winset(src, "Main.Defense", "text=[src.defense]")
			if("Dexterity")
				winset(src, "Main.Dexterity", "text=[src.dexterity]")
			if("Intelligence")
				winset(src, "Main.Intelligence", "text=[src.intelligence]")
			if("Luck")
				winset(src, "Main.Luck", "text=[src.luck]")

	updateAll()
		updateStats("HP")
		updateStats("MP")
		updateStats("EXP")
		updateStats("Strength")
		updateStats("Defense")
		updateStats("Dexterity")
		updateStats("Intelligence")
		updateStats("Luck")

mob/verb
	toggleChat()
		if(toggleChat == 0)
			toggleChat = 1
		else
			toggleChat = 0
		winshow(src, "Chat", toggleChat)
		var/position = winget(src, "Main", "pos")

		winset(src, "Chat","pos=[position]")

	toggleEquipment()
		if(toggleEquipment == 0)
			toggleEquipment = 1
		else
			toggleEquipment = 0
		winshow(src, "Equipment", toggleEquipment)
		var/position = winget(src, "Main", "pos")

		winset(src, "Equipment","pos=[position]")

	toggleEvents()
		if(toggleEvents == 0)
			toggleEvents = 1
		else
			toggleEvents = 0
		winshow(src, "Events", toggleEvents)
		var/position = winget(src, "Main", "pos")

		winset(src, "Events","pos=[position]")

	toggleSkills()
		if(toggleSkills == 0)
			toggleSkills = 1
		else
			toggleSkills = 0
		winshow(src, "Skills", toggleSkills)
		var/position = winget(src, "Main", "pos")

		winset(src, "Skills","pos=[position]")

	toggleStats()
		if(toggleStats == 0)
			toggleStats = 1
		else
			toggleStats = 0
		winshow(src, "Stats", toggleStats)
		var/position = winget(src, "Main", "pos")

		winset(src, "Stats","pos=[position]")