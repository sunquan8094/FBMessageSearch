#!/bin/bash
# fbmsgscript.sh

filename="messages.htm"
debug=0
if [[ ${!#} == "debug" ]]; then
  debug=1
fi

if [[ $# -ge 2 ]]; then
  filefound=$(ls "$1" | grep "$filename" -c)
  if [[ filedfound > 0 ]]; then
    sum=0
    k=$(($#-1))
    if [[ $debug == 1 ]]; then
      k=$(($#-2))
    fi
    for i in ${*:2:$k}; do
      actualregex=$(echo $i | sed -e 's/\|/\\\|/g' | sed -e 's/\?/\\\?/g' | sed -e 's/</\\\</g' | sed -e 's/>/\\\>/g')

#  Code below is used for debugging.
    if [[ $debug == 1 ]]; then
     cat $1$filename | sed 's/<p>/\
/g' | sed 's/<\/p>/\
/g' | sed s/\<div.*\>//g | sed 's/<\/div>//g' | sed "s/&#039;/\'/g" | sed 's/&quot;/\"/g'| grep -o "$actualregex"
    fi

      cnt=$(cat $1$filename | sed 's/<p>/\
/g' | sed 's/<\/p>/\
/g' | sed s/\<div.*\>//g | sed 's/<\/div>//g' | sed "s/&#039;/\'/g" | sed 's/&quot;/\"/g'| grep "$actualregex" -o -c )
((sum+=cnt))
      echo "There are ${cnt} instances of the regex \"$i\" in your Facebook exchanges."
    done
    echo "I found ${sum} instances total."
  else echo "I could not find the file in the specified directory."
  fi
else
  echo "You're missing parameters, yo."
fi
