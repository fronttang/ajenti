# /bin/bash
# 日志保存位置
base_path='/var/log/nginx'
# 获取当前年信息和月信息
log_path=$(date -d yesterday +"%Y%m")
# 获取昨天的日信息
day=$(date -d yesterday +"%d")
# 按年月创建文件夹
mkdir -p $base_path/$log_path
# 备份昨天的日志到当月的文件夹
mv $base_path/access.log $base_path/$log_path/access_$day.log
# 输出备份日志文件名
# echo $base_path/$log_path/access_$day.log
# 通过Nginx信号量控制重读日志
kill -USR1 `cat /run/nginx.pid`
