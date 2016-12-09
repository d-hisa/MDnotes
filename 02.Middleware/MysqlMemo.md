# Mysql How to use
## Summary
hogehoge
## Installation
### Setup Mysql Repository
#### Get Repository file
Ex.
```bash
$ wget http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm
```
#### Install Mysql Repository
```bash
$ rpm -ivh mysql-community-release-el7-5.noarch.rpm
```

### NOTICE: confirm before installing mysql
#### Confirm mysql repository without "dmr"
Confirm repolist use `yum repolist all`, you missed chosing rpm if find word "dmr".  
"dmr" is Development Milestone Release.  
"dmr" deprecated because it has many differences of action and specification.
#### Confirm mysql has installed previously.
**Important**   
Delete it if exist old mysql on this directory because conflict old mysql settings (ex. temporary password).
```bash
$ rm -rf /var/lib/mysql/
```
### Install Mysql Packages
```bash
$ yum install mysql mysql-community-server
```

## Base Settings
### Change Root Password
#### Search default root password this command
```bash
$ cat /var/log/mysqld.log | grep password
```
Ex.`A temporary password is generated for root@localhost: R7Sdw%F<yr9p`, and login  
```bash
$ mysql -u root -p
Enter password: default_passwprd
```
#### Default password Change
```SQL
mysql> alter user root@localhost identified by 'complex password'
```
complex password, is `a~zA~Z0~9` and any symbols.  
#### Uninstall plugin needs high policy password
```SQL
mysql> uninstall plugin validate_password;
```
#### Change simple password
```SQL
mysql> set password='simple password';
```
> **別の方法**  
`/etc/my.cnf`の末尾に`skip-grant-tables`を入れると、そのOSのroot権限を持っていれば`mysql -u root`でパス無しで入れる。その後手順2からやればOK。

### Change default Char Code
Edit file `/etc/my.cnf`, adding
```bash
[mysqld]
...
character-set-server=utf8 #mysqldセクションの末尾に追加

[client]
default-character-set=utf8 #clientセクションを追加
```
And restart Mysql(`systemctl restart mysqld`),  
check character code by this command
```SQL
mysql> show variables like "chara%";
```
また、テーブルカラムの設定を確認する場合は
```SQL
mysql> show create table tb_example \G;
```
すると、末尾に`DEFAULT CHARSET=utf8`となってればOK。
## Convenient Tools
### mycil
#### Feature points
+ Mysql Client soft
+ Easy install and use
+ You can use following function
  - Complement SQL command
  - Detail syntax highlight
#### Installation
##### Python
```bash
$ yum install python python-devel gcc
$ yum install setuptools
$ easy_install pip
$ pip install mycli
```
#### Usage
##### login
```bash
$ mycli -uUSER_NAME -pPASSWORD
```

## Commands
+ `create OPT NAME` :DBとかTableとかつくる
    * OPT/`database`
    * OPT/`table TABLE_NAME (RECORD_NAME TYPE(*length))`  
    Ex.`CREATE TABLE t1 ( id INT, dep INT, name CHAR(30) );`
  * OPT/`user 'USER_NAME'@'localhost' identified by ``  
  Ex.`create user 'testuser'@'localhost' identified by 'testuser';`
+ `show OPT`:OPTの
  * OPT/`databases`
  * OPT/`tables`
  * OPT/`colmuns from TABLE_NAME`
+ `select`
  * `select Host, User, Password from mysql.user;`  
  `select * from t1`
+ `load data [local] infile "FILE_PATH" into table TABLE_NAME [fields terminated by'foo'] [lines terminated by 'var'`  
:外部ファイルからのDB書き込み
  * localオプション：ローカルファイルを読む場合
  * terminateオプション：区切りを指定
    - fields:行区切り（ex. `","`）
    - lines:改行区切り(ex.`"\n"`)
> **注意点**  
> local infileコマンドを使うには、サーバ・クライアント双方においてローカルファイルを許諾する必要がある。  
+ サーバ側：ユーザのFILEオプションが有効である必要。rootなら既に持っている
+ クライアント側：ログイン時のlocal-infileオプションで指定
`$ mysql --local-infile=1 -u root -p`




## 目的別
### alter table change (for change colmun name)
Change name and type of colmun.
#### Usage
```SQL
alter table TABLE_NAME change OLD_COLMUN_NAME NEW_COLMUN_NAME COLMUN_TYPE;
```
##### notice
COLUMN_TYPE is required always.
### Auto increment initialize
#### All record delete and increment initialize
```SQL
mysql> truncate table TABLE_NAME;
```
#### Just now initialize increment
```SQL
mysql> alter table TABLE_NAME auto_increment=1;
```

## Reference
+ [MySQL 5.7 を CentOS 7 に yum インストールする手順 | WEB ARCH LABO](http://weblabo.oscasierra.net/installing-mysql57-centos7-yum/)
+ [mysqlで文字コードをutf8にセットする - Qiita](http://qiita.com/YusukeHigaki/items/2cab311d2a559a543e3a)
