function usage() {
  LOG_LEVEL=0

  if [ -n "$1" ]; then
    err $@
  fi

  err "$NAME [options]"
  err "  Semian Army uncages a monkey to cause errors, waits a time,"
  err "  and recages it."
  err
  err "Options:"
  err " -c <count> The number of iterations to run. 0 for unlimited. (1)"
  err " -L <level> The logging level. (2)"
  err " -h         Print this message."
  clear-and-exit 1
}

debug "checking options"
while getopts ":L:hc:" opt; do
  debug "found ${opt}"

  case $opt in
    L)
      LOG_LEVEL=$OPTARG
      ;;
    c)
      COUNT=$OPTARG
      ;;
    h)
      usage
      ;;
    \?)
      usage "Invalid argument -${OPTARG}"
      ;;
  esac
done
