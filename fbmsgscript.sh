#!/bin/bash
# fbmsgscript.sh

filename="messages.htm"
filefound=$(ls $1 | grep $filename | wc -l)

if [[ -n $1 ]] && [[ -n $2 ]] && [[ $filefound -eq 1 ]]; then
  sum=0
  for i in ${*:2:(($#-1))}; do 
    actualregex=$(echo $i | sed -e 's/\|/\\\|/g')
    cnt=$(cat $1$filename | sed 's/<p>/\
/g' | sed 's/<\/p>/\
/g' | sed s/\<div.*\>//g | sed 's/<\/div>//g' | sed 's/ /\
/g' | grep -e "$actualregex" | wc -l)
      ((sum+=cnt))
    echo "There are ${cnt} instances of the regex $actualregex in your Facebook exchanges."
  done
  echo "I found ${sum} instances total." 
elif [[ -z $2 ]] || [[ -z $1 ]]; then
  echo "You're missing parameters, yo."
elif [[ $filefound -le 0 ]]; then
  echo "I could not find the file in the specified directory." 
fi
