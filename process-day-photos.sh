#!/usr/bin/env bash
# change the contents of !!! for every trip day

# copy photo files to the working_folder
# cd working_folder
# copy geo tracks to ./geotag

# arrange and rename files:
# !!!
echo "___ STEP 1: moving and renaming files in current dir"
# phls -R | phmove . -a | phrename -a anb
echo "___."
# find _clock_ files and calculate time difference (UTC - photo) in seconds
echo "Find _clock_ files, calculate time delta (UTC-photo_time) and put in the script"
read -p "___ PAUSED (press enter to continue)"
# rename to get correct date-time in file-names
# !!!
echo "___ STEP 2: changing date-time-in-the-name"
phls -R | phrename -s -5
echo "___."

# fix dto and fmd
echo "___ STEP 3: fixing file_modify_date"
phls -R | phfixfmd
echo "___."
echo "___ STEP 4: fixing DateTimeOriginal tag"
phls -R | phfixdto
echo "___."

# put geo tags in files
# geotag0300home .
# !!!
echo "___ STEP 5: Adding geo-tags"
exiftool -preserve -overwrite_original -geotag "./geotag/*.*" '-geotime<${DateTimeOriginal}+03:00' .
echo "___."
