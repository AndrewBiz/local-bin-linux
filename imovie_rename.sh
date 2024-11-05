#!/bin/bash
# require bash version 4.3 or newver
# script for renaming imovie files from YYYY-MM-DD HH_MM_SS.ext to
# YYYYMMDD-HHMMSS_AAA NNNNNN-XX.ext

count=1
read -p "New file suffix: " name_suffix

if [[ -z $name_suffix ]] #check if null
then
	name_suffix="ANBHDV000"
fi

#while getopts s: option; do
#	case $option in
#		s) name_suffix=$OPTARG;;
#	esac
#done

# create rename script
echo '#!/bin/bash' > rename.sh

for file in "$@"
do
  file_new=${file//-/}
  file_new=${file_new//_/}
	file_new=${file_new// /-}
	seq=$(printf "%02d" $count)
  file_new=${file_new/./_ANB $name_suffix-$seq.}
  echo mv "'$file'" "'$file_new'" >> rename.sh
	count=$((count+1))
done

chmod +x rename.sh

echo script ./rename.sh created
