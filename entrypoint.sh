#!/bin/bash
append_params=""

if [ -n "$JOBS" ]; then
    append_params="$append_params --jobs $JOBS"
fi
logfile="$HOME/distccd.log"
touch "$logfile"
echo "Hi" > "$logfile"
distccd --allow 172.16.0.0/12 --allow 192.168.0.0/16 --allow 10.0.0.0/8 \
	--daemon \
	--log-level notice \
	--log-file "$logfile" \
	"${append_params}" && tail -f "$logfile"
