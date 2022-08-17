#!/bin/bash

# Title:		Group Project
# Author:		Clarence Munn

#========================================================================

# Location

echo "Good luck on your quest!"
echo "Before you begin, you must choose a route"
sleep 1
echo "________________________________________________"
sleep 1
echo ""
echo "Which route will you take to begin you journey?"
echo "a. Fiery Forrest 	b. Roaring River" 
read route

route1=$(echo $route | head -c 1 | tr [A-Z] [a-z])

if [[ $route1 == "a" ]];

then

echo "You have chosen the Fiery Forrest, hope you have extra water!"
 sleep 2
echo ""

echo "<^> <^> <^> <^> <^> <^> <^> <^> <^> <^> <^> <^> <^> "
echo ""

echo "Your journey through the Fiery Forrest has depleted your energy"
echo "What should you do?"
echo "a. rest for the  night	b. continue in the dark"
read journey

journey1=$(echo $journey | head -c 1 | tr [A-Z] [a-z])
sleep 2

echo "___________________________________________"
bear=$(( $RANDOM % 2 ))
wolves=$(( $RANDOM % 2 ))

	if [[ $journey1 == "a" ]];
	then
	echo "You have made camp for the night. Pick a number between 0-1"
	read camp
echo "__________________________________________"

		if [[ $bear == $camp ]];
		then 
		echo "In your rush to camp you left out food."
		echo "You were attacked by a bear while sleeping"
		sleep 2
		echo "You were killed. GAME OVER"
		exit 1
		else
		echo "SLEEPING"
		sleep 2
		echo "Your journey continues, energy has been replenished"
		echo "You have succesfully made it through the Fiery Forrest"
		fi
	else
	echo "Walking through the dark......."
	sleep 2
	echo "You are surrounded by a pack of wolves. Pick a number between 0-1"
	read dark
		if [[ $dark == $wolves ]];
		then
		echo "The leader of the pack seems to like you!"
		echo "You are now joined by a pack of wolves, attack increased by 50 HP"
 		sleep 1
		echo "You have successfuly made it through the Fiery Forrest"
		else
		echo "You were attacked and killed the pack of wolves. GAME OVER"
		exit 1
		fi
	fi
else

echo "You have chosen the Roaring River, good luck crossing!"

river_monster=$(( $RANDOM % 2 ))
boat=$(( $RANDOM % 2 ))

sleep 2
echo "you have come to the bank of the river. What will you do?"
sleep 1
echo "a. swim across		b. look for a boat"
	read river
river1=$(echo $river | head -c 1 | tr [A-Z] [a-z])
	if [[ $river1 == "a" ]];
	then
	echo "You have begun swimming"
	sleep 2
	echo "A River Monster has surfaced! Choose a number between 0-1"
	read rfight
		if [[ $rfight == $river_monster ]];
		then
		echo "After a fierce battle, the River Monster has retreated!"
		sleep 1
		echo "You have crossed the Roaring River succesfully!"
		else
		echo "The river monster drug you down to the bottom of the river"
		sleep 1
		echo "You were drowned. GAME OVER"
		exit 1
		fi
	else
	echo "You found a boat and began to cross. Choose a number between 0-1"
	read rowing
		if [[ $rowing == $boat ]];
		then
		echo "The Roaring River has the strongest currents of all"
		sleep 1
		echo "You have crossed the Roaring River successfully!"
 		else
		echo "You are halfway across the River"
		sleep 1
		echo "The boat is taking on water! You must jump and swim!"
		sleep 1
		echo "You were attacked by a River Monster. You died. GAME OVER"
	fi	fi
fi
exit 0
