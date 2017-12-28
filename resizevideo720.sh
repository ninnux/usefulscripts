#!/bin/bash
SOURCE_FILE=$@
DEST_SIZE=720

function spazi {
	echo $@ | sed 's/ /\\ /g'
}

#DESTINATION_FILE=$(echo $SOURCE_FILE | sed 's/\./_'$DEST_SIZE'./g')
DESTINATION_FILE=$(echo $SOURCE_FILE | sed 's/\(.*\)\.\(.*\)/\1_'$DEST_SIZE'.\2/')
SOURCE=$(spazi $SOURCE_FILE)
DEST=$(spazi $DESTINATION_FILE)
#DEST=$DESTINATION_FILE
#echo $SOURCE_FILE" ==> "$DESTINATION_FILE
echo $SOURCE" ==> "$DEST
#ffmpeg -i $SOURCE_FILE -vf scale=-2:$DEST_SIZE $DESTINATION_FILE 
COM="ffmpeg -i $SOURCE -vf scale=-2:$DEST_SIZE $DEST"
echo $COM
bash -c "$COM"
#ffmpeg -i $SOURCE -vf scale=-2:$DEST_SIZE '$DEST'
