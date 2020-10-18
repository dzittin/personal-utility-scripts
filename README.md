# Personal-local-bin-commands
Personal Linux Commands

Heat:
        Usage: heat [-r]

        Without arguments heat reads through a data file with Raspberry temperature records and
        prints a summary of the frequency of the highest and the low temperatures recorded.

        The -r argument prints the summary and it deletes the data file and restarts the 
        recording session.
        Presently a record is captured every 2 minutes and this is hardwired into the script. 
        This should be changed to take a interval capture time and use 2 minutes as a default.
