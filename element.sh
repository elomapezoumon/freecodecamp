#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ $1 ]]
  then
    if [[ $1 =~ ^[0-9]+$ ]]
      then
        SEARCH_ELEMENT=$($PSQL "select atomic_number,symbol,name from elements where (atomic_number=$1)")
      else
        SEARCH_ELEMENT=$($PSQL "select atomic_number,symbol,name from elements where (symbol='$1' or name='$1')")
    fi
    if [[ -z $SEARCH_ELEMENT ]]
      then
        echo -e "I could not find that element in the database."
      else
        IFS='|' read -ra ELEMENT <<< "$SEARCH_ELEMENT"
        ELEMENT_ATOMIC_NUMBER=${ELEMENT[0]}
        ELEMENT_SYMBOL=${ELEMENT[1]}
        ELEMENT_NAME=${ELEMENT[2]}
        SEARCH_PROPERTIES=$($PSQL "select atomic_number,atomic_mass,melting_point_celsius,boiling_point_celsius,type_id from properties where atomic_number=$ELEMENT_ATOMIC_NUMBER")
        IFS='|' read -ra PROPERTIES <<< "$SEARCH_PROPERTIES"
        SEARCH_TYPE=$($PSQL "select type from types where type_id=${PROPERTIES[4]}")
        IFS='|' read -ra TYPE <<< "$SEARCH_TYPE"
        echo -e "The element with atomic number $ELEMENT_ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a ${TYPE[0]}, with a mass of ${PROPERTIES[1]} amu. $ELEMENT_NAME has a melting point of ${PROPERTIES[2]} celsius and a boiling point of ${PROPERTIES[3]} celsius."
    fi
  else
    echo -e "Please provide an element as an argument."
fi