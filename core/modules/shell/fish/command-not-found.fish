function __fish_command_not_found_handler --on-event fish_command_not_found
  if [ -n "$MC_SID" ] || ! [ -t 1 ]
    echo $argv[1]': command not found' >&2
    return 127
  end
end
