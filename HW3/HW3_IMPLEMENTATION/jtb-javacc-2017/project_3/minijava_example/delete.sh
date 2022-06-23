#!/bin/bash
folder="../testDir/"
outputFolder="classFolder/"
class="*.class"
## create an empty assosiative array
for FILE in $folder* ; do
  echo $FILE
  javac $FILE
  fileName=$(basename "$FILE" .java)
  echo $fileName
  #echo $fileName
  picard SortSam I="$FILE" O="$fileName".out SO=coordinate CREATE_INDEX=TRUE > "$fileName".out 2>&1
  java $fileName > "$fileName".out
  find . -name '*.class' -exec rm -f {} \;
  #javac $FILE
done



