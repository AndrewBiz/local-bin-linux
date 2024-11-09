#!/bin/bash
# script for mass vgen generation
count=1

# create rename script
echo '#!/bin/bash' > mvgen.sh

for dir in "$@"
do
  if [ -d "$dir" ]
  then
    if [ -d "$dir/VIDEO-orig!!!" ]
    then
      seq=$(printf "%02d" $count)
      echo VGENing for "$dir" ...
      vgen -s "$dir/VIDEO-orig!!!" -t "$dir" -n vgen-$seq
      echo ./vgen-$seq.sh >> mvgen.sh
      count=$((count+1))
    else
      echo No dir VIDEO-orig!!! found. NO NEED TO convert files
    fi
  fi
done

chmod +x mvgen.sh
echo script ./mvgen.sh created
