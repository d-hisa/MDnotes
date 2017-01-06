# Linux Command Cheet sheet
[TOC]
## source
```bash
$ source hoge
```
hogeの中のコマンドを実行する。  
たとえば`~/.hogehoge`を変更したとき、ログイン時に読み込まれるがそれは面倒なので
`source ~/hogehoge`すると即実行されて便利。

## yum
### yum clean all
yumのキャッシュを削除。
### yum -list
yumのオプションリストを出してくれる
### yum list installed
yumでインストールされたパッケージ一覧が出る。

### yum repolist [all/enabled/disabled] [REPO_NAME] [-v]
#### all/enabled/disabled
+ `all`:全て見る
+ `enabled`:有効なものだけ。デフォルト（オプション無指定）はこれ
+ `disabled`:無効なものだけ

#### REPO_NAME
特定のリポジトリだけ見る。
#### -v
詳細に見る。ただし長いのでREPO_NAME指定したほうが良い。
### yumのリポジトリの場所
`/etc/yum.repos.d/`
### yum リポジトリの有効無効
.repoファイル内の`enabled`の0/1で管理。

### yum --enablerepo=FOO --disablerepo=VAR [install/update/repolist etc.]
yumのリポジトリを一時的に有効／無効にするオプション。  
正式なリポジトリの名前は`yum repolist`で調べておく。  
ただし詳細な名前は長く面倒なものが多いので、ワイルドカードを使うと便利。  
**Ex.**
```bash
$ yum --enablerepo=CentOS-* install HOGE
```
また、先に書いたほうが先に動作するので、
```bash
$ yum --disablerepo=* --enablerepo=FOO,VAR install HOGEHOGE
```
のように一度全部disableしてから特定のリポジトリをenableするようなやり方も可能（らしい）。
### yum 全体にプロキシを通す
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

## grep
検索に便利。  
`cat /hoge.log | grep foovar`みたいに検索かけるときにパイプでつなぐといい。  
```bash
$ grep MOJIRETSU PATH
ex.
$ grep hogehoge /etc/foo/var/*
```
みたいにも使える。

`grep -rnw foo * -e hoge -e test -e bar`

### options
- `-n`:行番号を表示する
- `-r`:リカーシヴ。サブディレクトリ内も検索する
- `-w`:検索が完全一致になる

## zip / unzip
### zip
`$ zip [-rq / -e --password=HOGE] [ZIPPED_FILE_NAME.zip] [ZIPPING_DIR_PATH]`
- r option: ディレクトリ内を再帰的に圧縮
- q option: 実行履歴を表示しない
- e option: パスワード付き書庫化。-`--password=HOGE`でパスワードを設定できる

### unzip
`unzip [EXTRACTING_FILE_PATH]`

## crontab
### usage
```bash
$ crontab [-uler]
```
- u: cronを実行するユーザを設定
- l: 現在のcronに設定されているリストを表示
- e: cronに登録する設定ファイルをvimで編集する
- r: 現在のcronをすべて削除する

### files
#### cron
`crontab -e`で編集するファイルは、通常ユーザを省いてよく、ユーザごとのcronとなる。  
システム全体のcronを指定する場合は、
- `/etc/crontab`
- `/etc/cron.d`

などに書く。sudoが必要
#### log
`/var/log/cron`

## realpath
相対パスを絶対パスにしてくれる。
```bash
$ cd ~/
$ mkdir test
$ cd test
$ realpath ./
/home/CURRENT_USER/test
```

## vmstat
CPUの占有率とかを見れる。  
詳細は[vmstatコマンド](http://www.fulldigit.net/content/view/54/6/)を見る。

## iptables
`iptables -nL`

## useradd
```bash
$ useradd -c "COMMENT" -g INIT_GROPU_NAME -G ADDED_GROPU_NAME -m USER_NAME
```
- `-c`: `/etc/passwd`にコメントがつく
- `-g`: イニシャルのグループ
- `-G`: 追加の所属グループ
- `-m`: ユーザディレクトリを自動的に生成

## tail
```bash
$ tail [-n LINE_NUM] [-f] [file_path_1] [file_path_2] ...
```
### options
- `n LINE_NUM`:LINE_NUMに任意の行数を指定することで、ファイル末尾の任意の行分を表示できる
- `f`:リアルタイム出力。logなどを見るときにつかう。`Ctrl + c`で止める。

## curl
### options
- `x`:proxy setting
### proxyを設定する
#### ラインから設定
```bash
$ curl -x PROXY_HOST:PORT_NUM FQDN
```
#### 設定ファイルに設定
`~/.curlrc`に設定する
```bash
$ touch ~/.curlrc
$ echo 'proxy-user = "USER_NAME:PASSWORD"' >> ~/.curlrc
$ echo 'proxy = "PROXY_HOST:PORT_NUM"' >> ~/.curlrc
$ source ~/.curlrc
```

## 環境変数にproxyを設定する
profileにexportで指定する
```bash
$ sudo vim /etc/profile
...
export=http_proxy=http://172.20.253.21:8080
```
ただしここに書いただけではrootユーザ(`sudo su`)には適用されないもよう。  
加えて、exportで環境変数的にproxyを通すと、全体がproxyに向くため、内部リポジトリを読みにいけなくなることに注意。
