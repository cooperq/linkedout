#!/bin/bash
SHAFILE='./SHA1.txt'
read -sp "Enter the password you would like to check (input will not be displayed): " PASSWORD
echo
HASH=`echo -n $PASSWORD | sha1sum - | awk '{print $1}'`
COUNT=`grep $HASH $SHAFILE | wc -l`
if [ $COUNT -gt 0 ]; then
  echo Your password was found!! Better Change it!
  exit
fi
HASH2=00000${HASH:5}
COUNT2=`grep $HASH2 $SHAFILE | wc -l`
if [ $COUNT2 -gt 0 ]; then
  echo Your password was found!! Better Change it!
  exit
fi
echo Your password was NOT found! Good Job!

