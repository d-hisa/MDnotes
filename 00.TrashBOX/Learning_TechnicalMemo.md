# 研修技術系メモ
## Mysql
### Setup
#### リポジトリの追加
`wget URL`  
`rpm -ivh mysql-hogehoge.rpm`
####


### コマンド
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

## PHP / Mysql
### Command

### Reference
[PDOの利用 | PHP Labo](http://www.php-labo.net/tutorial/class/pdo.html)

## DB
ikusei-10-dev-web-003
ikusei-10-pro-adb-001

## yumのproxy
[南砂wiki](https://ticket.pf.goo.ne.jp/redmine/projects/for_user_wiki/wiki/HTTP%E3%83%97%E3%83%AD%E3%82%AD%E3%82%B7%E3%83%BC)
でなんとか  
もしくは  
``` bash
sudo su
export http_proxy=http://172.20.253.21:8080
export https_proxy=http://172.20.253.21:8080
```
でなんとかなるかも。  

## Setupメモ
### yumにproxyを通す
`/etc/yum.conf`に以下を書き込む  
`http_proxy=http://172.20.253.21:8080`  
ただしこれはスマートではなく、proxy内のリポジトリを見に行くことができなくなる
### yumリポジトリにproxyを個別設定する
`/etc/yum.repos.d`以下にあるリポジトリファイル内に、
```bash
[foo package]
~
proxy=hogehogehoge
```
のように書くと良いexportの際と異なり、`http_proxy`**でないことに注意**  

### yumの仕方
`sudo yum --disaablerepo=FOO --enablerepo=VAR install HOGE_PACKAGE`
### yumするもの
- httpd
- mysql
  * mysql-community-server
  * mysql-community-client
-
