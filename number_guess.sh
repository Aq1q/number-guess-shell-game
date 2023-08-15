#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=guesses --tuples-only -c"

RANDOM_NUMBER=$((1 + $RANDOM % 1000))

echo "Enter your username:"
read USERNAME

DB_USER=$($PSQL "SELECT username, games_played, best_game FROM score WHERE username='$USERNAME'")
echo $DB_USER | while read DB_USERNAME BAR GAMES_PLAYED BAR BEST_GAME
do
  if [[ ! -z $DB_USERNAME ]]
  then 
    echo "Welcome back, $DB_USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  else 
    GAMES_PLAYED=0
    BEST_GAME="NULL"
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_RESULT=$($PSQL "INSERT INTO score(username, games_played, best_game) VALUES('$USERNAME', $GAMES_PLAYED, $BEST_GAME)")
  fi
done

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS
NUMBER_OF_GUESSES=1

while (( $USER_GUESS != $RANDOM_NUMBER )) 
do
if [[ ! $USER_GUESS =~ ^-?[0-9]+$ ]]
then
  echo "That is not an integer, guess again:"
else
  if (( $USER_GUESS > $RANDOM_NUMBER ))
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
fi
read USER_GUESS
((NUMBER_OF_GUESSES++))
done

DB_USER=$($PSQL "SELECT username, games_played, best_game FROM score WHERE username='$USERNAME'")
echo $DB_USER | while read DB_USERNAME BAR GAMES_PLAYED BAR BEST_GAME
do
  ((GAMES_PLAYED++))
  if (( $GAMES_PLAYED == 1 ))
  then
    UPDATE_RESULT=$($PSQL "UPDATE score SET games_played=$GAMES_PLAYED, best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
  elif (( $BEST_GAME > $NUMBER_OF_GUESSES ))
  then
    UPDATE_RESULT=$($PSQL "UPDATE score SET games_played=$GAMES_PLAYED, best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
  else 
    UPDATE_RESULT=$($PSQL "UPDATE score SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
  fi
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
