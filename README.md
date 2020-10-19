# Personal-local-bin-commands
Personal Linux Commands

Heat:
    Usage: heat [-r]
        
    Without arguments heat reads through a data file with
    Raspberry temperature records and prints a summary of the
    frequency of the highest and the low temperatures recorded.
    
    The -r argument prints the summary and it deletes the data
    file and restarts the recording session. Presently a record
    is captured every 2 minutes and this is hardwired into the script.
    This should be changed to use a flag that specifies
    an interval capture time and use 2 minutes as a default.

--------------------

mg:
    Usage mg [flags - do mg -help]

    A container script for git commands including init, commit,
    status, push, pull, undo, remote initialization

--------------------

pwsafe:
    Usage pwsafe [flags - do pwsafe -help ]

    A script to add lines to a file and crypt the file.
    The user is asked if a uncrypted version should be 
    left behind or removed. Pwsafe extracts lines based on
    a search string given on the command line (-e option).
    It will also dump an encrypted file in readable form.
    Dependencies: requires the scramble shell script and
    a symbolic link to scramble named "unscramble".
    
--------------------

scramble:
unscramble:
    Usage scramble filename
    Usage unscramble filename

    Encrypt a file using gpd. Given "filename" as an argument,
    the crypted data is put into "filename.enc" and the user
    is asked if "filename" is to be removed. 
    Scramble should be in the same directory as a symbolic link
    pointing to it named "unscramble". Invoking unscramble causes
    the encrypted file to be decrypted.
