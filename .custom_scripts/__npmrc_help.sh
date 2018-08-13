function __use_help() {
    echo "
    Usage: use <profile>
    Switch to another profile.
"
}

function __edit_help() {
    echo "
    Usage: edit <profile>
    Edit or create a profile.
    Opens the default editor ($editor) or the one specified through NPMRC_EDITOR env variable.
"
}

function __delete_help() {
    echo "
    Usage: delete <profile> [options]
    Delete a profile.
    Options:
        -y              Skip confirmation
"
}

function __list_help() {
    echo "
    Usage: list [options]
    List the available profiles.
    Options:
        -l              List as multiline
"
}

function __help() {
    echo "
    Usage: npmrc <command> [options]
    Commands:
        use <profile>                     Switch profile
        ed,edit <profile>                 Create or edit a profile
        del,delete <profile> [options]    Delete a profile
        ls,list [options]                 List available profiles
        version                           Display version
        help                              Print this message
    Options:
        -v,--version                      Display version
        -h,--help                         Print this message
"
}
