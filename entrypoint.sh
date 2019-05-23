#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -d $SPEC -o -c "" -m user

export HOME=$SPEC

echo "Home is $HOME, SPEC is $SPEC"
# ln -s $SPEC $HOME/SPEC2006
echo "cd $HOME && source shrc" >> $HOME/.bashrc

exec /usr/sbin/gosu user "$@"
