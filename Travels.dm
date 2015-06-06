mob
	proc
		Travels()
			//src << output("You take a break from killing monsters and take a stroll outside.","Travel")
			if(prob(100))
				var/Equipment/M = new/Equipment(src.class)

				var/modifier = M.returnStats()
				var/equipmentNum = M.returnNum()

				var/Equipment/playerEquipment = src.equipment[equipmentNum]

				if(playerEquipment)
					if(modifier > playerEquipment.returnStats())
						world << output("Threw away [playerEquipment] with [playerEquipment.returnStats()] attack.","Travel")
						src.equipment[equipmentNum] = M
						world << output("Picked up [src.equipment[equipmentNum]] with [modifier] attack.","Travel")
					else
						world << output("Found [M] with [modifier] attack and threw it away.","Travel")
				else
					src.equipment[equipmentNum] = M
					world << output("Picked up [src.equipment[equipmentNum]] with [modifier] attack.","Travel")

			else
				new/Quest(src)

Quest
	var/experienceReward
	var/mob/player

	New(var/mob/M)
		world << "test, quest new"
		player = M

	Monsters
		var/mob/list/monsters
		New()
			for(var/mob/monster/M)
				if(M.level == player.level)
					monsters = list(M, M)
					new /Battle(player, monsters)
	Boss

	Fetch

	Deliver

	Explore

	Escort
