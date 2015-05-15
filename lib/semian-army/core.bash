# Variables
NAME="$(basename $0)"
: ${COUNT:=1}
: ${REST_TIME:=60}
: ${LOCK:="/tmp/semian-army.lock"}


function check-lock() {
  if ! (set -o noclobber; echo "$$" > "${LOCK}") 2> /dev/null; then
    err "${NAME} is already running with lock ${LOCK}. Shutting down..."
    err "Lock held by $(cat ${LOCK})"
    exit 1
  else
    debug "registering trap"
    trap 'clear-lock' INT TERM EXIT
  fi
}

function clear-lock() {
  debug "$$ is removing lock ${LOCK}"
  rm -f ${LOCK}
}

function clear-and-exit() {
  clear-lock
  exit $1
}

function get-the-party-started() {
  debug "getting the party started"
  check-lock

  local monkeys=($(find-all-monkeys))
  debug "Monkeys: ${monkeys[@]}"

  local monkey=""

  i="0"
  while [ "$COUNT" -eq "0" -o  "$i" -lt "$COUNT" ]; do
    debug "iteration $i"

    local monkey=$(pick-random ${monkeys})
    debug "Monkey:" $monkey

    load-monkey $monkey
    run-monkey $monkey || debug "$monkey did not run"

    if [ "$COUNT" -ne 0 ]; then
      i=$(( $i + 1 ))
    else
      sleep $REST_TIME
    fi
  done
}
