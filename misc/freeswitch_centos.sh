#! /bin/sh
#
# freeswitch:       Starts the freeswitch Daemon
#
# chkconfig: 345 96 02
# processname: freeswitch
# description: Freeswitch centos init script \
# config:
# Author: gled
# Source function library.
. /etc/init.d/functions
. /etc/sysconfig/network
PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/freeswitch/bin
DESC="FreeSwitch Voice Switching System"
NAME=freeswitch
DAEMON=/usr/local/freeswitch/bin/$NAME
PIDFILE=/usr/local/freeswitch/log/$NAME.pid
do_setlimits() {
        ulimit -c unlimited
        ulimit -d unlimited
        ulimit -f unlimited
        ulimit -i unlimited
        ulimit -n 999999
        ulimit -q unlimited
        ulimit -u unlimited
        ulimit -v unlimited
        ulimit -x unlimited
        ulimit -s 244
        ulimit -l unlimited
        return 0
}
base=${0##*/}
do_start() {
        do_setlimits
        $DAEMON -nc
        RETVAL=$?
        if [ $RETVAL = 0 ]; then
                success $"$base startup"
        else
                failure $"$base startup"
        fi
        echo
        return $RETVAL
}
do_stop() {
        $DAEMON -stop
        RETVAL=$?
        [ $RETVAL = 0 ] && success $"$base shutdown" || failure $"$base shutdown"
        rm -f $LOCKFILE
        echo
        return $RETVAL
}
# See how we were called.
case "$1" in
  start)
        do_start
        ;;
  stop)
        do_stop
        ;;
  restart)
        do_stop
        echo "Waiting for daemon to exit..."
        sleep 5
        do_start
        ;;
  *)
        echo $"Usage: $0 {start|stop}"
        exit 2
        ;;
esac
exit $RETVAL