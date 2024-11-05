#!/bin/bash
# script for mass file to mp3 covretor generation

# USE CASE1 (only current dir processed):
# mass-2mp3.sh *.m4a

# USE CASE 2 (all found files processed)
# find . -name '*.m4a' -exec mass-2mp3.sh {} +

# info: working with file name parts in bash
# pax> a=/tmp/xx/file.tar.gz
# pax> xpath=${a%/*}
# pax> xbase=${a##*/}
# pax> xfext=${xbase##*.}
# pax> xpref=${xbase%.*}
# pax> echo;echo path=${xpath};echo pref=${xpref};echo ext=${xfext}
# path=/tmp/xx
# pref=file.tar
# ext=gz

script_name='cnv2mp3.sh'

# create rename script
echo '#!/bin/bash' > $script_name

for file in "$@"
do
    fname=${file##*/}  #file name without path
    fpath=${file%/*}   #file path only
    fbname=${fname%.*} #base name without extention
    echo ffmpeg -i "'$file'" -codec:a libmp3lame -qscale:a 1 "'$fpath/$fbname.mp3'" >> $script_name
done

chmod +x $script_name

echo script ./$script_name created
