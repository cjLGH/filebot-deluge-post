#!/bin/bash
torrentID=$1
torrentName=$2
torrentPath=$3
torrentMovePath=$4
path=$4/$2

#TRUE = Exists
if [[ -e "$path" ]]; then

    #TRUE = File
    if [[ -f "$path" ]]; then

        # Make a directory for the file.
        # Move file to the directory.
        # Check that filename is 3 characters in length before proceeding.
        fileExt=${torrentName: -4}  # Get file extension of .mkv, .mp4, .avi

        # Check that fileExt has a period in the 1st position.
        if [ ${fileExt::-3} == "." ]; then
            dirPath=${torrentName::-4} # Trim file extension of .mkv, mp4, .avi
            mkdir "$torrentMovePath/$dirPath" # Create directory
            cp "$path" "$torrentMovePath/$dirPath" # Move file to directory
            path="$torrentMovePath/$dirPath" # Variable update for end of script.

        fi
    fi

    # Filebot gather subtitles.
    /home/cjl/filebot/filebot.sh -get-missing-subtitles --output "srt" -non-strict "$path"
    # Filebot perform AMC (Automated Media Center) actions.
    /home/cjl/filebot/filebot.sh -script fn:amc --action duplicate -non-strict "$path" --log-file amc.log --def excludeList="$torrentMovePath/.excludes" "seriesFormat=/media/sdb/Videos/TV Shows/{n}/{'Season '+s.pad(2)}/{n} - {'s'+s.pad(2)}{'e'+e.pad(2)} - {t}" "movieFormat=/media/sdb/Videos/Movies/{n} ({y})/{n} ({y})"
    if [ "$path" != "$4/$2" ]; then
        rm -r $path
    fi
fi
