function voodoo
    set voodoo_start (gdate +%s.%N)

    function runsql --argument-names stmt --no-scope-shadowing
        set query_cnt (math "$query_cnt + 1")
        set voodoo_start (gdate +%s.%N)
        sqlite3 $DB_FILEPATH $argv[1]
        set voodoo_end (gdate +%s.%N)
        set voodoo_elapsed (math "$voodoo_elapsed + ($voodoo_end - $voodoo_start) * 1000.0")
    end

    function vatleast --argument-names version --no-scope-shadowing
        test (runsql 'pragma user_version;') -ge $argv[1]
    end

    function _ensure_db --no-scope-shadowing
        runsql 'select 1;' > /dev/null
    end

    function _migrate1 --no-scope-shadowing
        vatleast 1 || runsql "\
            begin transaction;

            pragma user_version = 1;
            pragma foreign_keys = on;

            create table todos (
                uid    integer primary key autoincrement,
                title  text    not null,
                isdone integer not null
            );

            create table tags (
                name text primary key
            );

            create table todos__tags (
                fk_todos integer not null,
                fk_tags  text    not null,
                foreign key (fk_todos) references todos(uid),
                foreign key (fk_tags)  references  tags(name)
            );

            commit transaction;"
    end

    function _todoadd --no-scope-shadowing
        read --prompt-str='/todo add/ enter title :: ' todo_newtitle
        runsql "insert into todos (title, isdone) values ('$todo_newtitle', 0);"
    end

    function _todonotdone --no-scope-shadowing
        runsql 'select title from todos where isdone=0;'
    end
    
    function _tododone --no-scope-shadowing
        runsql 'select title from todos where isdone=1;'
    end

    function _todoall --no-scope-shadowing
        runsql 'select title from todos;'
    end

    function _todomarkdone --no-scope-shadowing --argument-names title
        runsql "update todos set isdone=1 where title='$argv[1]';"
    end

    function _todounmarkdone --no-scope-shadowing --argument-names title
        for title in $argv
            runsql "update todos set isdone=0 where title='$title';"
        end
    end

    function _tododelete --no-scope-shadowing --argument-names title
        for title in $argv
            runsql "delete from todos where title='$title';"
        end
    end

    # init
    set query_cnt 0
    set --local IFS \t
    set --local DB_FILENAME 'voodoo.sqlite3'
    set --local DB_FILEPATH "$HOME/$DB_FILENAME"

    set --append todo_menu 'exit'
    set --append todo_menu 'refresh'
    set --append todo_menu 'version'
    set --append todo_menu 'todo add'
    set --append todo_menu 'todo show backlog'
    set --append todo_menu 'todo show all'
    set --append todo_menu 'todo undo'
    set --append todo_menu 'todo delete'

    _ensure_db && _migrate1 || return 1

    # main loop
    while true
        set todo_options $todo_menu
        set --append todo_options 'todo done '(_todonotdone)

        if test $query_cnt -eq 1
            set query_cnt_plur 'query'
        else
            set query_cnt_plur 'queries'
        end
        set voodoo_prompt (printf '[%d %s, %0.2f ms] /voodoo@%s/ enter command :: ' "$query_cnt" "$query_cnt_plur" "$voodoo_elapsed" "$hostname")
        set voodoo_elapsed 0
        set todo_choice (string join \n $todo_options | sk --prompt=$voodoo_prompt)
        set query_cnt 0

        if test $status -ne 0
            continue
        end

        set todo_match (string match --regex '^todo done (.*)$' $todo_choice | sed '1 d')
        if test (string length "$todo_match") -gt 0
             _todomarkdone $todo_match
             continue
        end

        switch $todo_choice
            case 'exit'
                return
            case 'version'
                cowsay 'voodoo alpha 0.1.0-schema1' | less
            case 'todo add'
                _todoadd
            case 'todo undo'
                _todounmarkdone (_tododone | sk --multi --prompt='/todo undo/ select :: ')
            case 'todo delete'
                _tododelete (_todoall | sk --multi --prompt='/todo undo/ select :: ')
            case 'todo show backlog'
                _todonotdone | sk --prompt='/todo show backlog/ search :: ' > /dev/null
            case 'todo show all'
                _todoall | sk --prompt='/todo show all/ search :: ' > /dev/null
            case 'refresh'
                continue
        end
    end
end