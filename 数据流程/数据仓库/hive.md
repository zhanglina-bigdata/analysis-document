## hive shell命令

- 创建表结构
   ```hiveql
   create table t_hive
  (   id int,
      age int,
      st int
  ) row format delimited fields terminated by '\t';
  ```
  - 例子
   json格式
   ```json
      {
      "name": "songsong",
      "friends": ["bingbing" , "lili"] , //列表 Array, 
      "children": { //键值 Map,
      "xiao song": 18 ,
      "xiaoxiao song": 19
      }
      "address": { //结构 Struct,
      "street": "hui long guan" ,
      "city": "beijing" 
      }  }
    ```
   文本存储格式
   ```text
   songsong,bingbing_lili,xiao song:18_xiaoxiao song:19,hui long 
   guan_beijing
   yangyang,caicai_susu,xiao yang:18_xiaoxiao yang:19,chao 
   yang_beijing
   ```
  建表语句
   ```hiveql
    create table test(
    name string,
    friends array<string>,
    children map<string, int>,
    address struct<street:string, city:string>
    )
    row format delimited 
    fields terminated by ','
    collection items terminated by '_'
    map keys terminated by ':'
    lines terminated by '\n';
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
- 增加一个字段
    ```hiveql
    alter table t_hive add columns (hh string);
    ```
- 表重命名
    ```hiveql
    alter table t_hive rename to t_rename;
    ```
- 删除表
    ```hiveql
    drop table r_rename;
    ```
  
  ### hive表数据的导入导出
  
    - 将本地路径的数据导到hive（hive中分隔符与本地文件分隔符一致）
        ```hiveql
        load data local inpath <本地路径> into <表明>;
        ```
    - 将hdfs的数据导到hive
        ```hiveql
        load data inpath <hdfs路径> into <表明>;
        ```
    - 将已存在表中的数据插入到hive表中
        ```hiveql
        insert into table test partition (age='25') select id, name, tel from wyp;
        ```
    - 在创建表的时候查询出其他表中的数据并插入到新创建的表中
        ```hiveql
        create table t_inner_table as select a,b from t_table;
        ```
    - 创建外部表
        ```hiveql
        create external table t_ext_table(a int ,b int ,c int ) row format delimited fields terminated by '\t';
        ```
      