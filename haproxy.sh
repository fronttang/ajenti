#!/bin/bash
echo $1
echo $App

function killProsess() {
	NAME=$1
	echo $NAME
	PID=$(ps -e | grep $NAME | awk '{print $1}')
	echo "PID: $PID"
	eval $(kill -9 $PID)
}

function start() {
	echo "start haproxy..."
	/bin/bash -c "/home/docker/haproxy/sbin/haproxy -f /home/docker/haproxy/conf/haproxy.cfg"
}

function stop() {
	echo "stop haproxy..."
	killProsess "haproxy"
}

function restart() {
	echo "restart haproxy..."
	stop
  sleep 3;
	start
}

case "$1" in
	start )
		start
		;;
	stop )
		stop
		;;
	restart )
		restart
		;;
	* )
    echo "usage: $0 {start|stop|restart}"
    exit 1
		;;
esac
