: ${LOG_LEVEL=2} # info

function log() {
  # get the type of message
  type=$1
  shift

  # date the message
  date=$(date)

  echo "${date} - ${type}: $@" >&2
}

function err() {
  echo $@ >&2
}

function error() {
  log "ERROR" $@
}

function warn() {
  if [ 1 -gt "$LOG_LEVEL" ]; then
    return 0
  fi

  log " WARN" $@
}

function info() {
  if [ 2 -gt "$LOG_LEVEL" ]; then
    return 0
  fi

  log " INFO" $@
}

function debug() {
  if [ 3 -gt "$LOG_LEVEL" ]; then
    return 0
  fi

  log "DEBUG" $@
}
