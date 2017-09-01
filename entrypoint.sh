#!/bin/bash

# Setup
CONF=/root/.blocknetdx/blocknetdx.conf

# check if username, password is set; if not, set it
source $CONF
if [ -z "$rpcuser" ] || [ -z "$rpcpassword" ]; then
    echo "credentials not found. creating new."
	RPC_USER=rpcuser
	RPC_PASS=$(cat /proc/sys/kernel/random/uuid)
    echo "rpcuser=$RPC_USER" >> $CONF
    echo "rpcpassword=$RPC_PASS" >> $CONF
fi  

echo "Starting blocknetdx with the following conf:"
cat $CONF

# if [ -f $CONF ];
# then
#         echo "credentials exists. using it.";
# else
#         # create new credentials
#         echo "creating new credentials";
#         RPC_USER=rpcuser
#         RPC_PASS=$(cat /proc/sys/kernel/random/uuid)
#         cat <<EOF >$CREDENTIALS
# RPC_USER=$RPC_USER
# RPC_PASS=$RPC_PASS
# EOF
#         echo "not found";
# fi

# # credential file contains RPC_USER, RPC_PASS. export then
# set -a
# source $CREDENTIALS
# set +a

# echo $RPC_USER
# echo $RPC_PASS

# Run
exec "$@"