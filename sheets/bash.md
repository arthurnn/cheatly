# Bash

- `!!` - Last command
- `!foo` - Run most recent command starting with 'foo...' (ex. !ps, !mysqladmin)
- `!foo:p` - Print command that `!foo` would run, and add it as the latest to
  command history
- `!$` - Last 'word' of last command (`/path/to/file` in the command
  `ls -lAFh /path/to/file`, `-uroot` in `mysql -uroot`)
- `!$:p` - Print word that `!$` would substitute
- `!*` - All but first word of last command (`-lAFh /path/to/file` in the
  command `ls -lAFh /path/to/file`, `-uroot` in `mysql -uroot`)
- `!*:p` - Print words that `!*` would substitute
- `^foo^bar` - Replace `foo` in last command with `bar`, print the result, then
  run. (`mysqladmni -uroot`, run `^ni^in`, results in `mysqladmin -uroot`)
- `{a,b,c}` passes words to the command, substituting `a`, `b`, and `c`
  sequentially (`cp file{,.bk}` runs `cp file file.bk`)

## Key bindings
- `Ctrl + a` - Jump to the start of the line
- `Ctrl + b` - Move back a char
- `Ctrl + c` - Terminate the command
- `Ctrl + d` - Delete from under the cursor
- `Ctrl + e` - Jump to the end of the line
- `Ctrl + f` - Move forward a char
- `Ctrl + k` - Delete to EOL
- `Ctrl + l` - Clear the screen
- `Ctrl + r` - Search the history backwards
- `Ctrl + R` - Search the history backwards with multi occurrence
- `Ctrl + t` - Transpose the current char with the previous
- `Ctrl + u` - Delete backward from cursor
- `Ctrl + w` - Delete backward a word
- `Ctrl + xx` - Move between EOL and current cursor position
- `Ctrl + x @` - Show possible hostname completions
- `Ctrl + z` - Suspend/ Stop the command
- `Ctrl + x`; `Ctrl + e` - Edit line into your favorite editor
- `Alt + <` - Move to the first line in the history
- `Alt + >` - Move to the last line in the history
- `Alt + ?` - Show current completion list
- `Alt + *` - Insert all possible completions
- `Alt + /` - Attempt to complete filename
- `Alt + .` - Yank last argument to previous command
- `Alt + b` - Move backward
- `Alt + c` - Capitalize the word
- `Alt + d` - Delete word
- `Alt + f` - Move forward
- `Alt + l` - Make word lowercase
- `Alt + n` - Search the history forwards non-incremental
- `Alt + p` - Search the history backwards non-incremental
- `Alt + r` - Recall command
- `Alt + t` - Transpose the current word with the previous
- `Alt + u` - Make word uppercase
- `Alt + back-space` - Delete backward from cursor

## Completion
(Here "2T" means Press TAB twice)

    $ 2T - All available commands(common)
    $ (string)2T - All available commands starting with (string)
    $ /2T - Entire directory structure including hidden one
    $ (dir)2T - Only Sub Dirs inside (dir) including Hidden one
    $ *2T - Only Sub Dirs inside without Hidden one
    $ ~2T - All Present Users on system from \"/etc/passwd\"
    $ $2T - All Sys variables
    $ @2T - Entries from "/etc/hosts"
    $ =2T - Output like ls or dir
    .bash_profile = sourced by login shell,
    .bashrc = sourced by all shells,
    .bash_aliases = should be sourced by .bashrc

Run something:

    for i in a b c; do $i 'hello'; done

Do something on a bunch of files:

    for i in *.rb; do echo "$i"; done

If syntax:

    if [[ -e .ssh ]]; then echo "hi"; fi

Numerical comparison:

    i=0
    if (( i <= 1 )); then
      echo "smaller or equal"
    else
      echo "bigger"
    fi

file check flags:

    -e:  file exists
    -f:  regular file (non directory)
    -d:  directory
    -s:  non-zero file
    -x:  execute permission

Avoid duplicates in your history:

    export HISTIGNORE="&:ls:ls*:[bf]g:exit"

more here:
<http://www.linuxtopia.org/online_books/advanced_bash_scripting_guide/fto.html>
