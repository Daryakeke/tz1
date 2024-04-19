#!/bin/bash
read -p "Введите адрес папки, файлы из которой требуется скопировать: " starting_folder
read -p "Введите адрес папки, в которую нужно скопировать файлы: " finish_folder
echo "Список файлов в изначальной папке:"
find "$starting_folder" -maxdepth 1 -type f
echo "Список вложенных папок:"
find "$starting_folder" -maxdepth 1 -type d | tail -n +2
echo "Список всех файлов:"
find "$starting_folder" -type f
for current_file in $(find "$starting_folder" -type f)
do
        name=$(basename "$current_file")
        if [ -e "$finish_folder/$name" ]
        then
                cur_dir=$(basename "$(dirname "$current_file")")
                cp $current_file $finish_folder/"${name%.*}"$cur_dir."${name##*.}"
        else
                cp $current_file $finish_folder/$name
        fi
done
echo "Копирование файлов завершено"
