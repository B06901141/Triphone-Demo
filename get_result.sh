# !/bin/bash

output=rescore.0.08.log
prefix="https://github.com/B06901141/Triphone-Demo/blob/master/"
postfix="?raw=true"
echo "data, label, result" > result.csv
for i in `ls dev | sed 's/.wav//g'`; do
    x="$i\b"
    label=`cat dev.text | grep $x | cut -d ' ' -f 2- | sed 's/,//g'`
    result=`cat $output | grep $x | cut -d ' ' -f 2- | cut -d$'\n' -f 2`
    echo $i
    echo "\"[$i]($prefix/dev/$i.wav$postfix)\",\"$label\",\"$result\"" >> result.csv
done
