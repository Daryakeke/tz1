#!/bin/bash
read -p "Введите адрес папки, файлы из которой требуется скопировать" starting_folder
read -p "Введите адрес папки, в которую нужно скопировать файлы" finish_folder
for current_file in $(find "$starting_folder" -type f)
do
        name=$(basename "$current_file")
        random_line=$(( RANDOM % 9000000 + 1000000 ))
        while [ -e ""$finish_folder"/"${name%.*}""$random_line.""${name##*.}"" ]
        do
                random_line=$(( RANDOM % 9000000 + 1000000 ))
        done
        cp "$current_file" ""$finish_folder"/"${name%.*}""$random_line.""${name##*.}""
done
echo "Копирование файлов завершено"