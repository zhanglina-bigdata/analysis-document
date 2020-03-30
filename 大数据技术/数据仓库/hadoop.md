## Hadoop基本操作命令

- hadoop dfsadmin -report  查看hdfs集群的存储空间使用情况。
- hadoop fs -du -h 目录  查看当前目录下各个文件占得内存
- hadoop fs –rmr /tmp/aaa删除一个目录
- hadoop fs –put文件 hdfs文件目录上传一个文件
- hadoop fs –get  hdfs文件下载地址目录下载一个文件
- hadoop fs –moveFromLocal文件hdfs文件目录上传一个文件同时删除本地文件
- haddop fs –text hdfs目录查看文件内容
- haddop fs –cat hdfs目录查看文件内容
- hadoop job –list获取任务列表
- hadoop job –kill job-id杀死一个job
- hadoop -daemon.sh start datanoe加入一个新的节点
- hadoop mradmin/dfsadmin –refreshnones删除一个节点
- yarn application -kill application_任务id：停止在yarn上运行的spark任务，在resourcemanager上执行
- hadoop fs -ls .Trash/Current （显示Current目录）
- hadoop fs -rm -r .Trash/Current （删除Current目录及其子目录）