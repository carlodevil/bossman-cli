# DESC: Acquire script lock
# ARGS: $1 (optional): Scope of script execution lock (system or user)
# OUTS: $script_lock: Path to the directory indicating we have the script lock
# NOTE: This lock implementation is extremely simple but should be reliable
#       across all platforms. It does *not* support locking a script with
#       symlinks or multiple hardlinks as there's no portable way of doing so.
#       If the lock was acquired it's automatically released on script exit.
function lock_init() {
    local lock_dir
    if [[ $1 = 'system' ]]; then
        lock_dir="/tmp/$script_name.lock"
    elif [[ $1 = 'user' ]]; then
        lock_dir="/tmp/$script_name.$UID.lock"
    else
        script_exit 'Missing or invalid argument to lock_init()!' 2
    fi

    if mkdir "$lock_dir" 2> /dev/null; then
        readonly script_lock="$lock_dir"
        verbose_print "Acquired script lock: $script_lock"
    else
        script_exit "Unable to acquire script lock: $lock_dir" 1
    fi
}