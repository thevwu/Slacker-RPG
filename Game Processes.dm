Timer
	var/mob/player

	New(mob/user)
		player = user
		Time()

	proc
		Time()
			set background = 1
			while(player)
				sleep(10)
				player.seconds++
				player.battleTime--
				player.travelTime--
				player.playerTime--

				adjustTime()
				checkForEvents()

		adjustTime()
			if(player.seconds>=60)
				player.minutes++
				player.seconds = 0

			if(player.minutes>=60)
				player.hours++
				player.minutes = 0

			if(player.hours>=24)
				player.days++
				player.hours = 0

			if(player.days>=7)
				player.weeks++
				player.days = 0

		checkForEvents()
			if(player.playerTime < 1) fightPlayers()
			if(player.battleTime < 1) fightMonsters()
			if(player.travelTime < 1) goTravel()

		fightPlayers()
			for(var/mob/M in world)
				if((M.client) && (player != M) && (!M.fighting))
					var/list/fighter_list = list(M)
					var/list/playerlist = list(player)
					new /Battle(playerlist, fighter_list)

					break

			player.playerTime = 250

		fightMonsters()
			var/list/playerlist = list(player)
			var/list/fighter_list = new/list

			for(var/i in 1 to 10)
				var/thing = pick("Single_Cell_Bacterium", "Deadly_Plant", "Mosquito")
				var/x = "/mob/monster/[thing]"
				var/y = text2path(x)
				y = new y

				playerlist.Add(y)

			for(var/i in 1 to 10)
				var/thing = pick("Single_Cell_Bacterium", "Deadly_Plant", "Mosquito")
				var/x = "/mob/monster/[thing]"
				var/y = text2path(x)
				y = new y

				fighter_list.Add(y)

		//	var/z = new /mob/monster/Single_Cell_Bacterium
			//var/list/fighter_list = list(y, z)


			new /Battle(playerlist, fighter_list)

			player.battleTime = 1000000000

		goTravel()
			player.Travels()
			player.travelTime = 1