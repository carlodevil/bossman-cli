# Bash Script Template with Useful Functions

This is a best practices Bash script template that combines the `source.sh` and `script.sh` files into a single script. If you want your script to be entirely self-contained then this should be what you want!

## Usage

To use this script, you can:

1. Copy the contents of this script and paste it into a new file.
2. Modify the functions in the script to suit your needs.
3. Run the script by typing `./index.sh` in your terminal.

## Functions

This script includes several useful functions that you can use in your own Bash scripts:

### `script_trap_err()`

Handler for unexpected errors.

#### Arguments:

- `$1` (optional): Exit code (defaults to 1)

### `script_trap_exit()`

Handler for exiting the script.

### `script_exit()`

Exit script with the given message.

#### Arguments:

- `$1` (required): Message to print on exit
- `$2` (optional): Exit code (defaults to 0)

#### Note:

The convention used in this script for exit codes is:

- `0`: Normal exit
- `1`: Abnormal exit due to external error
- `2`: Abnormal exit due to script error

### `script_init()`

Generic script initialization.

#### Arguments:

- `$@` (optional): Arguments provided to the script

#### Outputs:

- `$orig_cwd`: The current working directory when the script was run
- `$script_path`: The full path to the script
- `$script_dir`: The directory path of the script
- `$script_name`: The file name of the script
- `$script_params`: The original parameters provided to the script
- `$ta_none`: The ANSI control code to reset all text attributes

#### Note:

`$script_path` only contains the path that was used to call the script and will not resolve any symlinks which may be present in the path. You can use a tool like `realpath` to obtain the "true" path. The same caveat applies to both the `$script_dir` and `$script_name` variables.

## Debugging

To enable debugging in this script, you can set the `DEBUG` environment variable to `1`, `yes`, or `true`. This will enable the `xtrace` option, which traces the execution of the script.

## Shell Behaviors

This script also sets several shell behaviors to make your scripts more robust:

- `errexit`: Exit on most errors (see the manual)
- `nounset`: Disallow expansion of unset variables
- `pipefail`: Use last non-zero exit code in a pipeline

These shell behaviors are only enabled if the script is not being sourced.

## Error Traps

This script uses an error trap handler to catch unexpected errors and exit the script cleanly. If an unexpected error occurs, the `script_trap_err()` function is called with the appropriate exit code.

## Exit Traps

This script also uses an exit trap handler to ensure that the script exits cleanly. If the script exits normally, the `script_trap_exit()` function is called to perform any necessary cleanup.

## Exit Codes

This script uses the following exit codes:

- `0`: Normal exit
- `1`: Abnormal exit due to external error
- `2`: Abnormal exit due to script error
