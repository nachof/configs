#!/bin/bash

dir=$(cd $(dirname $0); pwd)
backup_dir=$dir/.backups
filelist=$dir/file_list

while read line
do
  file=$(echo $line | cut -d' ' -f 1)
  dest=$(echo $line | cut -d' ' -f 2 | sed -e 's|~|'$HOME'|' )
  if [ -e $dest ]; then
    mkdir -p $(dirname $backup_dir/$file)
    cp -L $dest $backup_dir/$file
    rm $dest
  fi
  ln -s $dir/$file $dest
done < $filelist
