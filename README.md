QuickNote is a simple note-taking script that lets you keep a log of your thoughts from the command line. 

To use, git clone or download the script, and add this to your .bashrc or .bash_profile:

alias n='bash /path/to/script/quick_note.bash'

Obviously, you should substitute "/path/to/script" with the file path to wherever you placed the quick_note.bash file. Then, open up the Terminal and type:

$ n

This will prompt you to enter a path to a directory that will hold your notes. I recommend putting your notes in a Dropbox folder, so that you can sync notes from multiple machines. After that, to enter a new note, you can type:

$ n this is a new note! 

"this is a new note!" will be saved to your notes file. To view your 10 most recent notes, type:

$ n

To view all notes, including information about the directory in which they were written and the hostname of the machine you were on, use the -a flag:

$ n -a

This is useful for searching old notes, e.g.:

$ n -a | grep "python"
 

 
