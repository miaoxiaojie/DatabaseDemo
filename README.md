# DatabaseDemo
FMDB高级使用
# FMDB
数据库FMDB高级使用
一：FMDB数据库的使用
   1.创建FMDBDatabaseDB.sqlite文件，拷贝文件到数据库中
      优点：减少代码创建表的冗余
           更加直观看到表
           添加字段和删除字段更加方便
   2.APP升级，数据库更新
     在数据库中放一张表存储当前版本，每次从库中查表版本，跟当前的版本是否一致，不一致升级，并且把当前的版本存到库中
   3.大量的操作数据库（比如大量的存储数据）
     事务