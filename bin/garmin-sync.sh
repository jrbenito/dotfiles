#!/bin/bash

## hardcoded to my Ubuntu machine, 
# need to make this more generic
# for now it will do the job

SOURCE="/media/jrbenito/GARMIN/Garmin/Activity/"
DESTINATION="/home/jrbenito/Dropbox/Apps/Garmin Activity/"
COMMAND="rsync -av"

# Demonize myself
# nohup ./myscript 0<&- &>/dev/null &
# or
# double background your script to have it detach from the tty
# cf. http://www.linux-mag.com/id/5981 
#(./program.sh &) & 
#(daemon_mode &) &

function daemon_mode {


    # wait until ubuntu mount it
    while [ ! -d /media/jrbenito/GARMIN ]; do
        sleep 5;
    done

    $COMMAND "$SOURCE" "$DESTINATION"
}

(daemon_mode &) &
