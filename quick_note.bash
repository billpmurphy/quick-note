#!/bin/bash

#Get the name of the log folder, or prompt for it
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $script_dir
if [ -a $script_dir/log_folder.txt ]; then
  read log_folder < $script_dir/log_folder.txt
else
  log_folder=0
  while [ ! -d "$log_folder" ]; do
    echo "Enter the path from the home directory to the log folder."
    read log_folder
    echo $log_folder > $script_dir/log_folder.txt
  done
fi

if [ $# -eq 0 ]; then #If we are reading previous notes
  prev_log=$(ls $log_folder/notes_* | sort | tail -1)
  if [ -a $prev_log ]; then
    echo -e "\n$(cut -f1,2 $prev_log | tail -10)\n"
  else
    echo -e "\nNo notes to display.\n"
  fi
else #If we are writing a new note, append it to the day's file
  curr_log=$log_folder/notes_$(date +%Y-%m-%d).txt
  time_fmt=$(date +%Y-%m-%d_%H:%M)
  echo -e "$time_fmt\t$*\t$(pwd)\t$(hostname)\t$(whoami)" >> $curr_log
fi 
