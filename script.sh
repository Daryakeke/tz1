#!/bin/bash
read -p "Введите адрес папки, файлы из которой требуется скопировать" starting_folder
read -p "Введите адрес папки, в которую нужно скопировать файлы" finish_folder
for current_file in $(find "$starting_folder" -type f)
do
        name=$(basename "$current_file")
        cur_dir=$(basename "$(dirname "$current_file")")
        cp "$current_file" ""$finish_folder"/"${name%.*}""$cur_dir.""${name##*.}""
done
echo "Копирование файлов завершено"