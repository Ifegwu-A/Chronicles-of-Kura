#!/bin/bash

#Group 2 - Agbai Anya(Team Leader)(finalboss360), Brian Louie(Presenter)(kura3git), Richard Deodutt(Supervisor)(RichardDeodutt), Lora Lee Barreto(Documenter)(LLBArch7), Clarence Munn(Documenter)(munney84)
#08/16/2022
#This script is for Group Project 1. It is a game inspired by NetworkChuck and Elden Ring.
#v1.0.0


#Color output, don't change
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m' 
#No color output, don't change
NC='\033[0m'


#Prints text to the terminal
print(){
    #First argument is the text to print
    Text=$1
    #Second arguement is the color to print
    Color=$2
    #If no color argument was provived then use no color
    if [ -z "$Color" ]; then
        Color=$NC
    fi
    #Print the text to terminal with color if any
    printf "${Color}%s${NC}\n" "$Text"
}

#Game over function, call this when the player dies
gameover(){
    #Print you died in red
    print "YOU DIED" $Red
    #Exit the game if you died
    exit 1
}

#Write the credits of the game creators here
rollcredits(){
    #Print the credits
    print "Created by Agbai Anya(Team Leader)(finalboss360)" $Purple
    print "Created by Brian Louie(Presenter)(kura3git)" $Purple
    print "Created by Richard Deodutt(Supervisor)(RichardDeodutt)" $Purple
    print "Created by Lora Lee Barreto(Documenter)(LLBArch7)" $Purple
    print "Created by Clarence Munn(Documenter)(munney84)" $Purple
    print "Inspired by NetworkChuck and Elden Ring" $Purple
}

#Game clear function, call this when the player wins
gameclear(){
    #Print you win in green
    print "YOU WIN" $Green
    #Print the credits
    rollcredits
    #Exit the game if you win
    exit 0
}

#Welcome to the game function, call this when the player starts the game
welcome(){
    #Send the player a welcome message
    print "Welcome to The Chronicles of Kura" $Green
}

#Do battle with a enemy, random chance of winning-RD
battle(){
    #0 is heads, 1 is tails
    #Enemy picks heads or tails randomly
    Enemy=$(shuf -i 0-1 -n1)
    #Player selection translated as 0 or 1, defaults to 0 until assigned
    Player=0
    #Ask the player to pick heads or tails
    printf "${Cyan}%s${NC}" "Lets flip a coin, pick heads or tails: H/T ? "
    #read the player's response
    read Flip
    #Only get the lowercase of the first character to check if heads or tails
    Flip=$(printf "%s" $Flip | tr [:upper:] [:lower:] | cut -c 1)
    #if response is 'h' it means 'heads' if is 't' it means 'tails'
    if [[ $Flip == 'h' ]]; then
        #player selected heads assign player to 0 for heads
        print "You selected heads" $Cyan
        Player=0
    elif [[ $Flip == 't' ]]; then
        #player selected tails assign player to 1 for tails
        print "You selected tails" $Cyan
        Player=1
    else
        #Flip was not understood so assume heads and assign player to 0 for heads
        print "Did not understand that assuming heads" $Cyan
        Player=0
    fi
    #Check if player guessed the random selection of the enemy
    if [ $Enemy -eq $Player ]; then
        #player guessed the same as the enemy so they win return true or 0
        return 0
    else
        #player guessed something different than the enemy so they lose return false or 1
        return 1
    fi
}

#charactercreation or selector function goes here
select_character() {

print  "Welcome traveler. Select your avatar: " $Green
print "1 - Vicious Viking" $Red
print "2 - Savage Sorcerer" $Purple
print "3 - Terrible Tyrant" $Cyan
read class

case $class in
	1 | "Vicious Viking")
	name="Vicious Viking"
	weapon="Sword of Odin"
	attack=35
        ;;
	2 | "Savage Sorcerer")
	name="Savage Sorcerer"
	weapon="Dark Magic"
	attack=40
	;;
	3 | "Terrible Tyrant")
	name="Terrible Tyrant"
	weapon="Battle Axe"
	attack=40
	;;
	*)
	print  "You selected poorly. Please choose again." $Green 
esac
clear
}


#move to location 1 and random event function goes here
choosepath() {
print "Next you must choose your path!!"

sleep 1
clear

print "Do you wish to enter the forest???" $Yellow
sleep 1
cat ./images/forest.txt
sleep 3
clear
print "Do you wish to enter the mountains???" $Cyan
sleep 2
cat ./images/mountain.txt
sleep 3
clear
print "Choose:" $Red
print "1 - Forest" $Red
print "2 - Mountains" $Red
read pick

case $pick in
        1 | "Forest" | "forest")
        print "It is settled. Your journey begins in the Demented Forest!" $Green
        sleep 1
        ;;
        2 | "Mountains" | "mountains")
        print "It is settled. Your journey begins in the Mountains of Mayhem!" $Purple
        sleep 1
        ;;
        *)
        print "You chose poorly. Select again" $Red
esac
}

#monster/minon battle against Cohort 1 and Cohort 2-RD
minionbattle(){
    #Name of the first enemy
    Enemy1="Cohort 1"
    #Name of the second enemy
    Enemy2="Cohort 2"
    #Enemy 1 dramatic entrance
    print "Wild $Enemy1 appeared!" $Yellow
    #Enemy 2 dramatic entrance
    print "Wild $Enemy2 appeared!" $Yellow
    #Tell player the battle started
    print "You are surrounded! Battle!" $Yellow
    #Call the battle function
    if battle; then
        #Won the battle and lived
        print "You VANQUISHED $Enemy1 and $Enemy2" $Green
    else
        #lost the battle and died
        print "$Enemy1 and $Enemy2 VANQUISHED You" $Red
        #Player died gameover
        gameover
    fi
}

#Boss battle function goes here
boss(){ 
Tyrone=$(($RANDOM % 2))

echo "Tyrone is preparing to attack with a build script! Pic>"

read defeated

if [[ $Tyrone == $defeated ]]; then

          echo "Tyrone is defeated!"

else

          echo "The build script is too powerful, you died"
          gameover
fi

}

#Main story or flow or events
main(){
    #welcome the player
    welcome

    #Character Maker or Selector-Brian
    select_character
    #Move to starting location-Brian
    choosepath
    #Move to location 1 and check if a random event happens-Clarence
    /bin/bash group_assignment.sh
    if [ $? -ne 0 ]; then
        gameover
    fi
    #Monster/Minion Battle-RD
    minionbattle
    #Move to Location 2 and check if a random event happens-Lora
    /bin/bash location2
    #Boss Battle-Agbai
    boss
    #Survived everything and reached the end of the game clearing it
    gameclear
}

#Starts the main story or flow of events
main