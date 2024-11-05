#!/bin/bash
# script for mass cue to mp3 covretor generation

script_name='cue2mp3.sh'

# create rename script
echo '#!/bin/bash' > $script_name

for file in "$@"
do
    cue_to_mp3.py "$file" >> $script_name
done

chmod +x $script_name

echo script ./$script_name created
