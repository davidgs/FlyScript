#! /bin/bash 


PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="Start the Flyscript portal on port 8000"
NAME=flyscript-portal


DAEMON=/usr/bin/python
DAEMON_ARGS=" ~/flyscript-portal/manage.py runserver  8000 "
LOGFILE=~/flyscript-portal/portal.log


# get the pid of any running server, in case we need to kill it.
PID=`ps -elf  | grep python | grep runserver | tail -1 | awk '{print $4}'`


do_start() {
	
	echo "Starting portal server ... "
	$DAEMON $DAEMON_ARGS >> $LOGFILE 2>&1 &

}

do_stop() {

	if [ $PID ] ; then
		echo "killing process $PID .."
		kill $PID
	else
		echo "Portal server not currently running."	
	fi
}

do_restart() {

	do_stop
	do_start
}

case "$1" in
    start)
	do_start
        ;;
    restart|reload|force-reload)
	do_restart
	;;
    stop)
	do_stop
        ;;
    *)
        echo "Usage: $0 start|stop" >&2
        exit 3
        ;;
esac
