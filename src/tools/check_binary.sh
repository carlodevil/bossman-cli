# DESC: Check a binary exists in the search path
# ARGS: $1 (required): Name of the binary to test for existence
#       $2 (optional): Set to any value to treat failure as a fatal error
# OUTS: None
function check_binary() {
    if [[ $# -lt 1 ]]; then
        script_exit 'Missing required argument to check_binary()!' 2
    fi

    if ! command -v "$1" > /dev/null 2>&1; then
        if [[ -n ${2-} ]]; then
            script_exit "Missing dependency: Couldn't locate $1." 1
        else
            verbose_print "Missing dependency: $1" "${fg_red-}"
            return 1
        fi
    fi

    verbose_print "Found dependency: $1"
    return 0
}