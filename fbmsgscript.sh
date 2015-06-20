#!/bin/bash
# fbmsgscript.sh

filename="messages.htm"

if [[ $# -ge 2 ]]; then
  filefound=$(ls "$1" | grep "$filename" -c)
  if [[ filedfound > 0 ]]; then
    sum=0
    for i in ${*:2:(($#-1))}; do
      actualregex=$(echo $i | sed -e 's/\|/\\\|/g' | sed -e 's/\?/\\\?/g' | sed -e 's/</\\\</g' | sed -e 's/>/\\\>/g')

  # Code below is used for debugging.
  #   cat $1$filename | sed 's/<p>/\
#/g' | sed 's/<\/p>/\
#/g' | sed s/\<div.*\>//g | sed 's/<\/div>//g' | sed "s/&#039;/\'/g" | sed 's/&quot;/\"/g'| grep "$actualregex" | grep -v '^$'

      cnt=$(cat $1$filename | sed 's/<p>/\
/g' | sed 's/<\/p>/\
/g' | sed s/\<div.*\>//g | sed 's/<\/div>//g' | sed "s/&#039;/\'/g" | sed 's/&quot;/\"/g'| grep "$actualregex" | grep -v '^$' -c)
      ((sum+=cnt))
      echo "There are ${cnt} instances of the regex \"$i\" in your Facebook exchanges."
    done
    echo "I found ${sum} instances total."
  else echo "I could not find the file in the specified directory."
  fi
else
  echo "You're missing parameters, yo."
fi
