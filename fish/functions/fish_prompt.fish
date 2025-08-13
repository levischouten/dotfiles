function fish_prompt
    # arrow + cwd
    echo -n (set_color cyan)'➜  '(set_color green)(basename (pwd))(set_color normal)

    # only show git info if we're inside a repo (fully silenced)
    if type -q git; and command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set branch (command git rev-parse --abbrev-ref HEAD 2>/dev/null)
        if test -n "$branch"
            echo -n (set_color magenta)" git:($branch)"(set_color normal)

            command git diff --quiet --ignore-submodules --cached >/dev/null 2>&1
            set staged $status
            command git diff --quiet --ignore-submodules >/dev/null 2>&1
            set unstaged $status

            if test $staged -ne 0 -o $unstaged -ne 0
                echo -n (set_color red)' ✗'(set_color normal)
            else
                echo -n (set_color green)' ✓'(set_color normal)
            end
        end
    end

    echo -n ' '
end
