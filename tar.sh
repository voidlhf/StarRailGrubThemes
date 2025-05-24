#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source_dir="$script_dir/assets/themes"
destination_dir="$script_dir/themes"
mkdir -p "$destination_dir"
cd "$source_dir" || exit 1
for folder in */; do
  folder_name=${folder%/}
  tar -czvf "$destination_dir/$folder_name.tar.gz" "$folder_name"
done
