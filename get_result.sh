# !/bin/bash

output=rescore.0.08.log
echo "data, label, result" > result.csv
for i in `ls dev | sed 's/.wav//g'`; do
    x="$i\b"
    label=`cat dev.text | grep $x | cut -d ' ' -f 2- | sed 's/,//g'`
    result=`cat $output | grep $x | cut -d ' ' -f 2- | cut -d$'\n' -f 2 | sed 's/,//g'`
    echo $i
    echo "[$i](./dev/$i.wav),$label,$result" >> result.csv
done
