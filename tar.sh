#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source_dir="/assets/themes"

destination_dir="/themes"


cd "$script_dir/$source_dir"

for folder in */; do
  folder_name=${folder%/}
  tar -czvf "$script_dir/$destination_dir/$folder_name.tar.gz" "$folder_name"
done

