# Set of util functions

# cpu-count
#  Return the number of CPUs.  If the CPU cannot be determined then
#  4 is returned
function cpu-count() {
  if [ $(uname) == "Darwin" ]; then
    debug "We are OS X"
    return $(sysctl -n hw.ncpu)
  else
    debug "Unknown system"
    return 4
  fi
}


# kill-all-cmds
#  Kills all processes (owned by the current user) that match a pattern
function kill-all-cmds() {
  info "killing processes matching $1"
  ps | grep "${1}" | grep -v grep | awk '{print $1}' | xargs kill -9
}
