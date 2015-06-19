#!/bin/bash
# fbmsgscript.sh

filename="messages.htm"

if [ -n $1 -a -n $2 ]; then
  sum=0
  for i in ${*:2:(($#-1))}; do 
    cnt=$(cat $1$filename | sed 's/<p>/\
/g' | sed 's/<\/p>/\
/g' | sed s/\<div.*\>//g | sed 's/<\/div>//g' | sed 's/ /\
/g' | grep -e $i | wc -l)
      ((sum+=cnt))
    echo "There are ${cnt} instances of the regex $i in your Facebook exchanges."
  done
  echo "I found ${sum} instances total" 
else
  echo "You're missing parameters, yo."
fi
