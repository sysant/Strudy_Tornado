#!/bin/bash
# 20210623 at san
# chkconfig: 2345 10 90
# description: logclid

. /etc/init.d/functions

started(){
  nohup python3 ./qiu.py > nohup.out 2>&1 &
  [ "$?" -eq 0 ] && success $"$base startup" || failure $"$base startup"
  echo
}
stoped(){
 echo -n "Stopping ShuangSeQiu:"
 kill $(ps aux |grep qiu.py|grep -v grep|awk '{print $2}')
 [ "$?" -eq 0 ] && success $"$base startup" || failure $"$base startup"
 echo
}

statused(){
if [ ! -s `ps aux |grep qiu.py|grep -v grep|awk '{print $2}'` ]
then
     echo "ShuangSeQiu is ($(ps aux |grep qiu.py|grep -v grep|awk '{print $2}')) running ..."
else
    echo "ShuangSeQiu is stopped."
fi
}

case $1 in
    start)
    started
    ;;
    stop)
    stoped
    ;;
    status)
    statused
    ;;
    restart)
    stoped
    sleep 1
    started
    ;;
    *)
    echo "start|stop|status"
    ;;
esac
