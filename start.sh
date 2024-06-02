cd /usr/local/hadoop/sbin
./start-dfs.sh # http://localhost:9870
./start-yarn.sh

hdfs dfsadmin -safemode leave

# Spark

# stop-master.sh
# stop-worker.sh

start-master.sh  # Khởi động master
start-worker.sh spark://master:7077  # Khởi động worker, thay thế "master" bằng tên máy chủ hoặc địa chỉ IP của master

# http://localhost:8080

# Start hive metastore
# Start new tmux and run command below
# hive --service metastore --hiveconf hive.root.logger=INFO,console
tmux new-session -d -s hive_metastore 'hive --service metastore --hiveconf hive.root.logger=INFO,console'

# hive --service hiveserver2 --hiveconf hive.root.logger=INFO,console
tmux new-session -d -s hive_server2 'hive -- service hiveserver2 --hiveconf hive.root.logger=INFO,console'

# hdfs dfs -rm -r -skipTrash hdfs://master:9000/user/hduser/groups_tble

# sudo cat /var/log/mysql/error.log