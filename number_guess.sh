#!/bin/bash
#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"
NUMBER=$(( RANDOM % 1000 + 1 ))

function ASK_QUESTION() {
  read PLAYER_NUMBER
  if [[ ! $PLAYER_NUMBER =~ ^[0-9]+$ ]]
    then echo -e "That is not an integer, guess again:"
    else
    if [[ $PLAYER_NUMBER -gt $1 ]]
      then echo -e "It's lower than that, guess again:"
      else
        if [[ $PLAYER_NUMBER -lt $1 ]]
          then echo -e "It's higher than that, guess again:"
        fi
    fi  
  fi
}

function FINAL_MESSAGE(){
  PLAYER_LAST_SCORE=$($PSQL "select best_game from players where player_id=$1")
  if [[ $PLAYER_LAST_SCORE = 0 || $3 -lt $PLAYER_LAST_SCORE ]]
    then UPDATE_PLAYER_INFOS=$($PSQL "update players set best_game=$3 where player_id=$1")
  fi
  echo -e "You guessed it in $3 tries. The secret number was $2. Nice job!"
}

echo "Enter your username:"
read USERNAME
SEARCH_USERNAME=$($PSQL "select * from players where username='$USERNAME'")

if [[ -z $SEARCH_USERNAME ]]
  then
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_NEW_PLAYER=$($PSQL "insert into players (username) values ('$USERNAME')")
    NEW_PLAYER_ID=$($PSQL "select player_id from players where username='$USERNAME'")
    UPDATE_PLAYER_INFOS=$($PSQL "update players set games_played=(games_played+1) where username='$USERNAME'")
    echo -e "Guess the secret number between 1 and 1000:" 
    GUESSES=1
    ASK_QUESTION $NUMBER
    until [[ $PLAYER_NUMBER = $NUMBER ]]
    do
      ASK_QUESTION $NUMBER
      ((GUESSES=GUESSES+1))
    done
    FINAL_MESSAGE $NEW_PLAYER_ID $NUMBER $GUESSES
  else
    SEARCH_PLAYER_INFOS=$($PSQL "select player_id,username,games_played,best_game from players where username='$USERNAME'")
    IFS='|' read -ra PLAYER_INFOS <<< "$SEARCH_PLAYER_INFOS"
    echo -e "Welcome back, $USERNAME! You have played ${PLAYER_INFOS[2]} games, and your best game took ${PLAYER_INFOS[3]} guesses."
    UPDATE_PLAYER_INFOS=$($PSQL "update players set games_played=(games_played+1) where username='$USERNAME'")
    echo $NUMBER
    echo -e "Guess the secret number between 1 and 1000:" 
    GUESSES=1
    ASK_QUESTION $NUMBER
    until [[ $PLAYER_NUMBER = $NUMBER ]]
    do
      ASK_QUESTION $NUMBER
      ((GUESSES=GUESSES+1))
    done
    FINAL_MESSAGE ${PLAYER_INFOS[0]} $NUMBER $GUESSES
fi