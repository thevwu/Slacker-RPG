BattleWrapper
	var/mob/element
	var/isPlayer
	var/isFriendly
	var/teamNum

	New(var/mob/newElement, var/player, var/friendly, var/num)
		element = newElement
		isPlayer = player
		isFriendly = friendly
		teamNum = num

	proc
		isPlayer()
			return isPlayer

		isFriendly()
			return isFriendly

		getName()
			return "[element.name][teamNum]"

		getElement()
			return element

		getDexterity()
			return element.dexterity

		getSkills()
			return element.Skills

		getLuck()
			return element.luck

		getStrength()
			return element.strength

		getDefense()
			return element.defense

		getAttackBonus()
			return element.attackBonus

		getDefenseBonus()
			return element.defenseBonus

		getHP()
			return element.HP

		getExperience()
			if(isPlayer)
				return round(element.level * 2.5)
			else
				return element.experience

		restoreStats()
			element.HP = element.MaxHP
			element.MP = element.MaxMP

		giveExperience(var/EXP)
			element.experience += EXP

		removeHP(var/HPremoval)
			element.HP -= HPremoval

Queue
	var topElement
	var lastElement
	var/list/elements
	var/size = 0

	New()
		topElement = 1
		lastElement = 1
		elements = new/list(0)

	proc
		peek()
			return elements[topElement]

		offer(var/item)
			elements.Add(item)
			size++

		remove(var/item)
			elements.Remove(item)
			size--

		poll()
			var/returnElement = elements[1]
			elements.Remove(elements[1])
			size++

			return returnElement

		isEmpty()
			if(size == 0) return TRUE
			else return FALSE