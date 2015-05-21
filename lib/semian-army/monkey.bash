# find-all-monkeys
#  This echos each loaded monkey, plus any that are in the monkey path
function find-all-monkeys() {
  # all the loaded monkeys
  for x in "$MONKEYS"; do
    echo $x
  done

  # any found monkeys
  find $EXT_MONKEY_PATH -name "*.bash" || true
}

function pick-random() {
  local monkeys=($@)
  local idx=$(( $RANDOM % ${#monkeys[@]} ))
  echo ${monkeys[$idx]}
}

function load-monkey() {
  debug "reloading base monkey"
  source ${INT_MONKEY_PATH}/base.bash

  debug "loading: $1"
  source $1
}

function run-monkey() {
  runnable || return 255

  debug "running monkey"
  uncage &&
    sleep ${PARTY_TIME} &&
    cage
}
