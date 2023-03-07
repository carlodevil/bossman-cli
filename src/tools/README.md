How to import scripts
---------------------

To use these functions in your shell script, you need to first import them. Assuming that all of the functions are in their own `.sh` files with the same name as the function itself (e.g. `build_path.sh`) and located in a directory called `tools`, you can import them into your script using the `source` command:

bashCopy code

`source tools/build_path.sh 
source tools/check_binary.sh 
# etc...`

This will make all of the functions available in your script.

Note that the `source` command is used to execute the contents of the specified file in the current shell context, which means that any variables or functions defined in the file will be available in the calling script. If you omit the `source` command and simply call the file as a script (e.g. `./tools/build_path.sh`), a new shell context will be created and any variables or functions defined in the script will not be available in the calling script.

If you want to import all of the scripts at once, you can use a wildcard to match all of the `.sh` files in the `tools` directory:

bashCopy code

`for script in tools/*.sh; do
    source "$script"
done`

This will import all of the scripts in the `tools` directory into your script.

Quick Use Description
---------------------

This is a collection of Bash functions that can be used in various scripts. Here is a quick summary of each function:

*   `build_path()`: combines two path variables and removes any duplicates
*   `check_binary()`: checks if a binary exists in the search path
*   `check_superuser()`: validates superuser access as root (via sudo if requested)
*   `color_init()`: initializes color variables for ANSI control codes
*   `cron_init()`: initializes cron mode and sets the path to the file stdout & stderr are redirected to
*   `script_exit()`: exits the script with a given message and exit code
*   `script_init()`: initializes a script and sets various script-related variables
*   `lock_init()`: acquires a lock to prevent other instances of the script from running
*   `parse_init()`: parses command-line arguments and sets corresponding variables
*   `pretty_print()`: pretty prints a provided string with a specified color
*   `run_as_root()`: runs a command as root (via sudo if requested)
*   `script_usage()`: prints usage information for the script
*   `script_trap_err()`: handles unexpected errors and exits the script with a given exit code
*   `script_trap_exit()`: handles script exit and releases any locks
*   `verbose_print()`: only pretty prints a string if verbose mode is enabled.

