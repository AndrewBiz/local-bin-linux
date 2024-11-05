#!/bin/bash
# script for mass vgen generation

count=1

# create rename script
#echo '#!/bin/bash' > mvgen.sh

for dir in "$@"
do
  if [ -d "$dir" ]
  then
    if [ -d "$dir/web-ok" ]
    then
      echo Directory "$dir/web-ok" exists. NO NEED TO convert files
    elif [ -d "$dir/web" ]
    then
      echo Directory "$dir/web" exists. NO NEED TO convert files
    else
      seq=$(printf "%02d" $count)
      echo VGENing for "$dir" ...
      vgen -s "$dir" -t web -n vgen-$seq #>> mvgen.sh
      echo Creating directory "$dir/web" ...
      mkdir "$dir/web"
      count=$((count+1))
    fi
  fi
done

#chmod +x mvgen.sh

#echo script ./mvgen.sh created
