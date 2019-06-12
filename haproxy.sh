#!/bin/bash
echo $1
echo $App

function killProsess() {
	NAME=$1
	echo $NAME
	PID=$(ps -e | grep $NAME | awk '{print $1}')
	echo "PID: $PID"
	kill -9 $PID
}

function start() {
	echo "start haproxy..."
	/home/docker/haproxy/sbin/haproxy -f /home/docker/haproxy/conf/haproxy.cfg
}

function stop() {
	echo "stop haproxy..."
	killProsess "haproxy"
}

function restart() {
	echo "restart haproxy..."
	stop
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
		;;
esac
