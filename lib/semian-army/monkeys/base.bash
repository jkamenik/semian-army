## Base Monkey
##
## This monkey gets loaded right before the actual monkey gets loaded
## and serves as the defaults.

function runnable() {
  return 0
}

function uncage() {
  info "uncaging base monkey"
}

function cage() {
  info "caging the base monkey"
}
