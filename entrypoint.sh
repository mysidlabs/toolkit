#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

myid=${MYID:-9001}

echo "Starting as ${SIDUSER} with UID: ${myid}"
groupadd --gid ${myid} ${SIDUSER}
useradd --shell /bin/bash --uid ${myid} --gid ${myid} --non-unique --no-create-home ${SIDUSER}

[[ ! -d /home/${SIDUSER} ]] && mkdir /home/${SIDUSER}
chown -R ${myid}:${myid} /home/${SIDUSER}
export HOME=/home/${SIDUSER}

exec /usr/local/bin/gosu ${SIDUSER} "$@"
