## hive shell命令

- 创建表结构
   ```hiveql
   create table t_hive
  (   id int,
      age int,
      st int
  ) row format delimited fields terminated by '\t';
  ```
- 将按tab分隔的数据导入到表中(追加表数据)
    ```hiveql
    load data local inpath '/home/zhanglina/demo.txt'  into table t_hive;
    ```

- 将按tab分隔的数据导入到表中(覆盖表数据)
    ```hiveql
    load data local inpath '/home/zhanglina/demo.txt'  overwrite into table t_hive;
    ```
- 正则查看表
    ```hiveql
    show tables '*t*';
    ```
- 查看表结构
    ```hiveql
    desc t_hive;
    desc formatted t_hive;  //查看表结构明细
    ```