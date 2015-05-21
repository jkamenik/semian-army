## BURN CPU Monkey
##
## This monkey spins up a cpu intensive task once for each cpu

CMD="openssl speed"

function uncage() {
  info "uncagging burncpu"
  local cpu=$(cpu-count ; echo $?)
  local i=0
  debug "${cpu} CPUs"

  while [ ${i} -lt ${cpu} ]; do
    debug "starting ${CMD} ($i)"

    ${CMD} &
    i=$(( $i + 1 ))
  done
}

function cage() {
  kill-all-cmds "${CMD}"
}
