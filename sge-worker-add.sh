#!/bin/bash

QUEUE=$1
HOSTNAME=$2
SLOTS=$3

# add to the execution host list
TMPFILE=sge.hostname-$HOSTNAME
echo "hostname $HOSTNAME\nload_scaling NONE\ncomplex_values NONE\nuser_lists NONE\nxuser_lists NONE\nprojects NONE\nxprojects NONE\nusage_scaling NONE\nreport_variables NONE" > $TMPFILE
qconf -Ae $TMPFILE
#rm $TMPFILE

# add to the all hosts list
qconf -aattr hostgroup hostlist $HOSTNAME @RRgrid

# enable the host for the queue, in case it was disabled and not removed
qmod -e $QUEUE@$HOSTNAME

if [ "$SLOTS" ]; then
    qconf -aattr queue slots "[$HOSTNAME=$SLOTS]" $QUEUE
fi
