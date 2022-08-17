#!/bin/bash

# Lora Lee B. August 17, 2022.


# Our fearless Player1 has decidedly defeated the first beast,
# and now moves on to face the Boss Beast.
# But the question is "Where?!"
# Location is a key part of the Player's strategy!


echo "Welcome to the Boss Battle! Please select your battleground! (1/2/3):
1 - Frozen Tundra
2 - Temperate Rainforest
3 - Tropical Beach"

read location2

luck=$(( $RANDOM % 2 ))

if [[ $location2 == 1 && $luck == 0 ]]; then
    echo "No sure footing, slippery terrain. Your defense points have decreased by 5!"
elif [[ $location2 == 1 && $luck == 1 ]]; then
    echo "No sure footing for Boss Beast, slippery terrain. Your defense points have inccreased by 5!"
elif [[ $location2 == 2 && $luck == 0 ]]; then
    echo "You suffers a viper bite. Your dense points have decreased by 5!"
elif [[ $location2 == 2 && $luck == 1 ]]; then
    echo "Boss Beast suffers viper bite. Your dense points have increased by 5!"
elif [[ $location2 == 3 && $luck == 0 ]]; then
    echo "You step on a sea urchin. Your health points have decreased by 7!"
elif [[ $location2 == 3 && $luck == 1 ]]; then
    echo "Fresh coconut water. Your health points have increased by 7!"

# Catch all for entries that do not follow the criteria of 1/2/3.

else
    echo "Boring! Your choice nonetheless."
fi

exit 1
