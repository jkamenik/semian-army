## Rebooter
##
## This monkey reboots the system.

function runnable() {
  which "reboot"
}

function uncage() {
  sudo reboot
}

# No cage function since this is a one way only trip
