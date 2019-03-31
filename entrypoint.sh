append_params=""

if [ -n "$JOBS" ]; then
    append_params="$append_params --jobs $JOBS"
fi

hash gcc-8 && echo "gcc found" && gcc-8 --version || echo "gcc not found"
hash clang-8 && echo "clang found" && clang --version || echo "clang not found"
distccd --allow 172.16.0.0/12 --allow 192.168.0.0/16 --allow 10.0.0.0/8 \
	--daemon \
	--log-level notice \
	--log-file /home/distcc/distcc.log \
	--user=distcc \
	$append_params
tail -f /home/distcc/distcc.log
