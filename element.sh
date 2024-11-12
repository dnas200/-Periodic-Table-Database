#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"

# Check if an argument is provided
SELECT_ELEMENT=$1
if [[ -z $SELECT_ELEMENT ]]
then
  echo -e "Please provide an element as an argument."
  exit
fi

# Search for the element by atomic number, symbol, or name
if [[ $1 =~ ^[1-9]+$ ]]
then 
  SELECT_ELEMENT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM properties AS p JOIN elements AS e ON p.atomic_number = e.atomic_number JOIN types AS t ON t.type_id = p.type_id WHERE e.atomic_number = '$1'")
  else 
  SELECT_ELEMENT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol,t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM properties AS p JOIN elements AS e ON p.atomic_number = e.atomic_number JOIN types AS t ON t.type_id = p.type_id WHERE e.name = '$1' or e.symbol = '$1'")
fi

# if element not in database
if [[ -z $SELECT_ELEMENT ]]
then 
 echo -e "I could not find that element in the database."
 exit
fi

echo $SELECT_ELEMENT | while IFS=" |" read AN NAME SYMBOL TYPE MASS MPC BPC
do
echo -e "The element with atomic number $AN is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
done

