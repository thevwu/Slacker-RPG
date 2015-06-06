/*
How to implement:

Battle system, multiple monsters, multiple players.  Put in a queue to handle the manipulation of turns.



***********************************************************************
*			* + means good alignment at time of class advancement.    *
*  Classes	* = means neutral alignment at time of class advancement. *
*			* - means evil alignment at time of class advancement.    *
***********************************************************************
******************************************************************
*     SWORDSMAN   	 **       THIEF		   **		MAGE		 *
*	 		    	 **					   **					 *
*  2ND CLASS	     **  2ND CLASS		   **  2ND CLASS		 *
*+  FIGHTER			 **+  BODYGUARD		   **+ CLERIC			 *
*=  PAGE			 **=  HITMAN		   **= SAGE				 *
*-  SPEARMAN		 **-  ROGUE			   **- WIZARD			 *
*					 **					   **					 *
*  3RD CLASS		 **  3RD CLASS		   **3RD CLASS			 *
*++ PALADIN			 **++ ENFORCER		   **++ SAINT			 *
*+= HERO			 **+= CHAMPION		   **+= ARCHMAGE		 *
*+- FALLEN KNIGHT	 **+- SENTINEL		   **+- FALLEN			 *
*					 **					   **					 *
*=+ TEMPLAR			 **=+ SHADOWER		   **=+ SUMMONER		 *
*== TITAN			 **== GUNSLINGER	   **== ELDER SAGE		 *
*=- BERSERKER		 **=- NINJA			   **=- NECROMANCER		 *
*					 **					   **					 *
*-+ LANCER			 **-+ BANDIT		   **-+ SORCERER		 *
*-= DRAGOON 		 **-= ASSASSIN		   **-= WARLOCK			 *
*-- DARK KNIGHT		 **-- NIGHT LORD	   **-- CHAOS WIZARD	 *
******************************************************************


*****************

Equipment Classes

Weak
Average
Refined
Masterwork
Perfect

Add spell bonuses
Accessories can add skills
Damage variance, bloodstained kilij can hit for like 90-95, but my more risky adamantite siege axe does 40-160
maybe you could have something like that but it's like 90% chance of 1-10 and 10% chance of massive damage

*****************

Subscriptions

10 dollars - lifetime
5 dollars - a year

Subscriptions should get 5% time off the timers.
Subscribers get ranger class.
Subscribers get a 10% extra chance to go on travels, 10% extra chance to get a travel event.
5% extra chance in finding items.

Possible 2 dollars a month to get an extra 5% time off the timers.

Pay 10 dollars for a custom equipment of your choice [refined class] that you get to have.
Pay 5 dollars extra to turn it into masterwork, 10 dollars to turn it into perfect.

Pay 30 dollars for a set of custom equipment [refined] that you get to have.
5 dollars to turn one into masterwork, 10 dollars to turn one into perfect, 20 for all masterwork, 40 for all perfect.


Subscribers get access to lizard mount.
Mounts get to grow, add stats, and the ability to attack and level up.

*********************

--Mounts--

   Egg [Subscriber]
     + Dragon
       ++ Bahamut
       +=
       +- Chimera
     = Lizard
       =+
       ==
       =-
     - Snake
       -+
       -= Hydra
       -- Basilisk

   Pony
     = Horse
	 ++ Pegasus
	 Minotaur
	 Manticore
	 Unicorn
	 Sleipnir
	 Lion
	 Nightmare
   Chick
     + Chicken
	     ++
	     +=
	     +- Cockatrice
     = Bird
        =+
     	== Phoenix
     	=-
     - Eagle
       -+
       -= Gryphon
       -- Roc

   Puppy
   	 + Dog
   	 =
     - Wolf
     Wolverine
     --Werewolf
     Fox