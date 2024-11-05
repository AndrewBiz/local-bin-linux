#!/bin/bash

# * to mp3 coversion example

# AVG   BITRATE   OPTION
# 245   220-260   -q:a 0
# 225   190-250   -q:a 1   #!!! most usefull for Apple Music conversion
# 190   170-210   -q:a 2
# 175   150-195   -q:a 3
# 165   140-185   -q:a 4
# 130   120-150   -q:a 5
# 115   100-130   -q:a 6
# 100   80-120    -q:a 7
# 85    70-105    -q:a 8
# 65    45-85     -q:a 9

ffmpeg -i input.mp4 -codec:a libmp3lame -qscale:a 1 output.mp3

# # count=1
# # read -p "New file suffix: " name_suffix
# #
# # if [[ -z $name_suffix ]] #check if null
# # then
# #   name_suffix="ANBHDV000"
# # fi
# #
# #while getopts s: option; do
# #  case $option in
# #    s) name_suffix=$OPTARG;;
# #  esac
# #done
#
# # create rename script
# echo '#!/bin/bash' > rename.sh
#
# for file in "$@"
# do
#   file_new=${file//-/}
#   file_new=${file_new//_/}
#   file_new=${file_new// /-}
#   seq=$(printf "%02d" $count)
#   file_new=${file_new/./_ANB $name_suffix-$seq.}
#   echo mv "'$file'" "'$file_new'" >> rename.sh
#   count=$((count+1))
# done
#
# chmod +x rename.sh
#
# echo script ./rename.sh created
