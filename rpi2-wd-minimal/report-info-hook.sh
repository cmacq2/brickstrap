#
# Generate a nice looking report at the end of the multistrap/brickstrap process
# The purpose of the report is to group all relevant information needed to log in, etc.
#

[ -n "$BOARD_HOSTNAME" ] && info "Board host name: $BOARD_HOSTNAME"
[ -n "$ROOT_PASSWORD" ] && info "Root password: $ROOT_PASSWORD"
[ -n "$DEFAULT_USER_NAME" ] && info "Default user: $DEFAULT_USER_NAME"
[ -n "$DEFAULT_USER_PASSWORD" ] && info "Default user password: $DEFAULT_USER_PASSWORD"
