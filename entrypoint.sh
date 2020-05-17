#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

UID=${UID:-9001}

echo "Starting with UID: ${UID}"
groupadd --gid ${UID} sidgroup
useradd --shell /bin/bash --uid ${UID} --gid ${UID} --non-unique --no-create-home sid

[[ ! -d /home/sid ]] && mkdir /home/sid
chown -R ${UID}:${UID} /home/sid
export HOME=/home/sid

exec /usr/local/bin/gosu sid "$@"
