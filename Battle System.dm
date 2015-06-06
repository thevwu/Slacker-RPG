Battle
	var/Queue/challengers
	var/list/BattleWrapper/friendlies[0]
	var/list/BattleWrapper/enemies[0]
	var/list/BattleWrapper/fighterList
	var/BattleWrapper/newMob

	var/i
	var/num

	var/playerExperienceGiven
	var/enemyExperienceGiven


	New(var/list/mob/players, var/list/mob/challenging)
		var/isPlayer
		var/mob/M

		for(i in 1 to players.len) //take in the friendly mobs, add to list
			isPlayer = FALSE
			M = players[i]

			if(M.client)
				isPlayer = TRUE

			newMob = new /BattleWrapper(players[i], isPlayer, TRUE, i)
			friendlies.Add(newMob)

		for(i in 1 to challenging.len) //take in the enemies
			isPlayer = FALSE
			M = challenging[i]

			if(M.client)
				isPlayer = TRUE

			newMob = new /BattleWrapper(challenging[i], isPlayer, FALSE, i)
			enemies.Add(newMob)

		fighterList = enemies + friendlies //combined list of both

		determineOrder(fighterList) //sort it

		fight() //start the fight

	proc
		determineOrder(var/list/BattleWrapper/fighters)
			var/list/BattleWrapper/determineSpeed[fighters.len]

			for(i in 1 to fighters.len)
				determineSpeed[i] = fighters[i]

			for(i in 1 to fighters.len - 1)
				var/maxSpeed = i
				var/j

				for(j = i + 1, j <= fighters.len, j++)
					var/BattleWrapper/compare1 = determineSpeed[j]
					var/BattleWrapper/compare2 = determineSpeed[maxSpeed]
					if(compare1.getDexterity() > compare2.getDexterity())
						maxSpeed = j

				if(maxSpeed != i)
					var/swap = determineSpeed[i]
					determineSpeed[i] = determineSpeed[maxSpeed]
					determineSpeed[maxSpeed] = swap


			addFighters(determineSpeed) //add them to the queue

		addFighters(var/list/BattleWrapper/fighters)
			var/size = fighters.len

			var/Queue/newChallengers = new /Queue(size)
			challengers = new /Queue(size)

			for(i in 1 to fighters.len)
				newChallengers.offer(fighters[i])

			challengers = newChallengers

		addFighter(var/mob/M, var/isFriendly)
			var/BattleWrapper/newMob = new /BattleWrapper(M, FALSE, isFriendly)
			if(isFriendly)
				friendlies.Add(newMob)
			else
				enemies.Add(newMob)

			fighterList.Add(newMob)
			challengers.offer(newMob)

		fight()
			var/BattleWrapper/damageDealer = challengers.poll()
			var/BattleWrapper/damageTaker

			if(!(damageDealer.isFriendly())) //if the damage dealer isn't friendly
				num = rand(1, friendlies.len)
				damageTaker = friendlies[num] //the person who takes damage will be

			else
				num = rand(1, enemies.len)
				damageTaker = enemies[num]

			doDamage(damageDealer, damageTaker)

		doDamage(var/BattleWrapper/attacker, var/BattleWrapper/target)
			var/list/options = new()

			//for(var/P in attacker.getSkills()) options += P
			options += "Attack"

			var/attackType = pick(options)

			if(attackType == "Attack")
				world << "normalattack"
				normalAttack(attacker, target)

			if(istype(attackType, /Skill/Spell)) spellAttack(attacker, target, attackType)
			if(istype(attackType, /Skill/Summon)) summonFamiliar(attacker, target, attackType)
			if(istype(attackType, /Skill/Physical)) physicalAttack(attacker, target, attackType)

			if(deathCheck(target)) //if the target died
				if(target != attacker) //if person who died isn't attacker, not really necessary but just incase
					challengers.offer(attacker) //add them back into the queue

				if(friendlies.len == 0 || enemies.len == 0) //if one side has no more people, end the battle
					endBattle()

					return
			else
				challengers.offer(attacker) //if not, just add the attacker back in
			fight() //next person gets to deal damage

		normalAttack(var/BattleWrapper/attacker, var/BattleWrapper/target)
			sleep(10)

			var/Critical = attacker.getLuck() / target.getLuck() / 25

			if(rand(attacker.getDexterity() / 1.5, attacker.getDexterity())+20 < rand(target.getDexterity() / 1.5, target.getDexterity()))
				world << "[attacker.getName()] tried to attack [target.getName()], but missed!"
			else
				var/damage = round(((attacker.getStrength() - round(rand(target.getDefense() / 2, target.getDefense()))) * attacker.getAttackBonus()) / target.getDefenseBonus())

				if(damage <= 0)
					world << "[attacker.getName()] struck [target.getName()], but was unable to do any damage!"
				else if(prob(Critical))
					target.removeHP(round(damage * 1.3))
					world << "[attacker.getName()] does a critical hit on [target.getName()] for [round(damage * 1.3)] damage!"
				else
					target.removeHP(damage)
					world << "[attacker.getName()] attacks [target.getName()] for [damage] damage!"

		spellAttack(var/BattleWrapper/attacker, var/BattleWrapper/target, var/attackType)
		summonFamiliar(var/BattleWrapper/attacker, var/BattleWrapper/target, var/attackType)
		physicalAttack(var/BattleWrapper/attacker, var/BattleWrapper/target, var/attackType)

		deathCheck(var/BattleWrapper/M)
			world << "[M.getName()] has [M.getHP()] left  isfriendly: [M.isFriendly()]"
			if(M.getHP() <= 0)
				if(M.isFriendly())
					enemyExperienceGiven += M.getExperience()
					M.restoreStats()
					friendlies.Remove(M)
				else
					playerExperienceGiven += M.getExperience()
					M.restoreStats()
					enemies.Remove(M)

				challengers.remove(M)

				return 1
			else
				return 0


		endBattle()
			world << "ENDBATTLE"
			var/BattleWrapper/M
			if(friendlies.len == 0)
				for(var/i in 1 to enemies.len)
					M = enemies[i]
					M.giveExperience(enemyExperienceGiven)

				world << "friendlies lost!  exp given to enemy: [enemyExperienceGiven]"

			if(enemies.len == 0)
				for(var/i in 1 to friendlies.len)
					M = friendlies[i]
					M.giveExperience(playerExperienceGiven)

				world << "enemies lost! exp gained: [playerExperienceGiven]"
