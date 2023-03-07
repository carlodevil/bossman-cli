Write a readme markdown file with a quickuse description for all. Add a guide at the start of the readme on how to import scripts: 

# NAME: build_path()
# DESC: Combines two path variables and removes any duplicates
# ARGS: $1 (required): Path(s) to join with the second argument
#       $2 (optional): Path(s) to join with the first argument
# OUTS: $build_path: The constructed path

# NAME: check_binary()
# DESC: Check a binary exists in the search path
# ARGS: $1 (required): Name of the binary to test for existence
#       $2 (optional): Set to any value to treat failure as a fatal error
# OUTS: None

# NAME: check_superuser()
# DESC: Validate we have superuser access as root (via sudo if requested)
# ARGS: $1 (optional): Set to any value to not attempt root access via sudo
# OUTS: None

# NAME: color_init()
# DESC: Initialise colour variables
# ARGS: None
# OUTS: Read-only variables with ANSI control codes
# NOTE: If --no-colour was set the variables will be empty. The output of the
#       $ta_none variable after each tput is redundant during normal execution,
#       but ensures the terminal output isn't mangled when running with xtrace.
# shellcheck disable=SC2034,SC2155

# NAME: cron_init()
# DESC: Initialise Cron mode
# ARGS: None
# OUTS: $script_output: Path to the file stdout & stderr was redirected to

# NAME: script_exit()
# DESC: Exit script with the given message
# ARGS: $1 (required): Message to print on exit
#       $2 (optional): Exit code (defaults to 0)
# OUTS: None
# NOTE: The convention used in this script for exit codes is:
#       0: Normal exit
#       1: Abnormal exit due to external error
#       2: Abnormal exit due to script error

# NAME: script_init()
# DESC: Generic script initialisation
# ARGS: $@ (optional): Arguments provided to the script
# OUTS: $orig_cwd: The current working directory when the script was run
#       $script_path: The full path to the script
#       $script_dir: The directory path of the script
#       $script_name: The file name of the script
#       $script_params: The original parameters provided to the script
#       $ta_none: The ANSI control code to reset all text attributes
# NOTE: $script_path only contains the path that was used to call the script
#       and will not resolve any symlinks which may be present in the path.
#       You can use a tool like realpath to obtain the "true" path. The same
#       caveat applies to both the $script_dir and $script_name variables.
# shellcheck disable=SC2034

NAME: lock_init()
# DESC: Acquire script lock
# ARGS: $1 (optional): Scope of script execution lock (system or user)
# OUTS: $script_lock: Path to the directory indicating we have the script lock
# NOTE: This lock implementation is extremely simple but should be reliable
#       across all platforms. It does *not* support locking a script with
#       symlinks or multiple hardlinks as there's no portable way of doing so.
#       If the lock was acquired it's automatically released on script exit.

# NAME: parse_init()
# DESC: Parameter parser
# ARGS: $@ (optional): Arguments provided to the script
# OUTS: Variables indicating command-line parameters and options

# NAME: pretty_print()
# DESC: Pretty print the provided string
# ARGS: $1 (required): Message to print (defaults to a green foreground)
#       $2 (optional): Colour to print the message with. This can be an ANSI
#                      escape code or one of the prepopulated colour variables.
#       $3 (optional): Set to any value to not append a new line to the message
# OUTS: None

# NAME: run_as_root()
# DESC: Run the requested command as root (via sudo if requested)
# ARGS: $1 (optional): Set to zero to not attempt execution via sudo
#       $@ (required): Passed through for execution as root user
# OUTS: None

# NAME: script_usage()
# DESC: Usage help
# ARGS: None
# OUTS: None

# NAME: script_trap_err()
# DESC: Handler for unexpected errors
# ARGS: $1 (optional): Exit code (defaults to 1)
# OUTS: None

# NAME: script_trap_exit()
# DESC: Handler for exiting the script
# ARGS: None
# OUTS: None

# NAME: verbose_print()
# DESC: Only pretty_print() the provided string if verbose mode is enabled
# ARGS: $@ (required): Passed through to pretty_print() function
# OUTS: None

