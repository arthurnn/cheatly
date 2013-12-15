_cheatly_complete() {
    local cur prev commands lists
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    local IFS=$'\n'

    if [ $COMP_CWORD -eq 1 ]; then
        commands=`cheatly | sed -n 's/.* \$ cheatly \([a-z]*\).*$/\1/p'`
        COMPREPLY=( $( compgen -W '${commands}' -- ${cur} ) )
    elif [[ $COMP_CWORD -eq 2 && "$prev" == show ]]; then
        lists=`cheatly list | sed -n 's/  \(.*\)$/\1/p'`
        COMPREPLY=( $( compgen -W '${lists}' -- ${cur} ) )
    fi
}
complete -F _cheatly_complete cheatly

