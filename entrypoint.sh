#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

myid=${MYID:-9001}

echo "Starting with UID: ${myid}"
groupadd --gid ${myid} sidgroup
useradd --shell /bin/bash --uid ${myid} --gid ${myid} --non-unique --no-create-home sid

[[ ! -d /home/sid ]] && mkdir /home/sid
chown -R ${myid}:${myid} /home/sid
export HOME=/home/sid

exec /usr/local/bin/gosu sid "$@"
