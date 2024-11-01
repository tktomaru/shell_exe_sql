#!/bin/bash

set -e

# ファイル名を設定
file1="table1.sql"
file2="table2.sql"
file3="table3.sql"

file1_tmp="table1_tmp.sh"
file2_tmp="table2_tmp.sh"
file3_tmp="table3_tmp.sh"

# ファイルを行ごとにループ
paste --delimiters="|" "$file1" "$file2"  "$file3" | while IFS="|" read -r line1 line2 line3; do

    # 各行が空であるかを確認
    if [[ -z "$line1" || -z "$line2" || -z "$line3" ]]; then
        break
    fi

    (echo $line1 | tr -d "\r" | tr -d "\n") > $file1_tmp
    (echo $line2 | tr -d "\r" | tr -d "\n") > $file2_tmp
    repA=$(bash $file1_tmp)
    repB=$(bash $file2_tmp)

    echo $repA
    echo $repB

    echo "$line3"
    line3=$(echo -e "$line3" | awk  -v res1="${repA}" '{gsub(/\[replaceA\]/, res1); print}')
    echo "$line3"

    line3=$(echo -e "$line3" | awk  -v res2="${repB}" '{gsub(/\[replaceB\]/, res2); print}' )
    echo "$line3"

    echo "$line3" > $file3_tmp
    line3=$(bash $file3_tmp)
    echo "$line3"

    echo "------"
done

