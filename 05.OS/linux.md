# Linux Environments and Commands
[TOC]
## Environments
### TimeZoneとLocale
#### TimeZone
```bash
$ timedatectl status
$ timedatectl list-timezone | grep "jp"
$ timedatectl set-timezone Asia/Tokyo
```
#### Locale
```bash
$ localectl status
$ localectl list-locales | grep "ja"
$ localectl set-locale LANG=ja_JP.utf8
$ localectl list-keymap | grep "ja"
$ localectl set-keymap jp106
```

### ssh
#### .ssh/config
```bash
[~/.ssh/config]
# Iterative Hello ping
ServerAliveInterval 60
# Tunnell(Humidai)
Host humidai
        HostName HUMIDAI_DOMAIN
        User USER_NAME
        Port 22
        IdentityFile PRIVATE_KEY_PATH
        ForwardAgent yes	# default set "ssh -A" option
```
#### ssh-agent
WindowsだとPageantがやってくれるエージェントフォワード。  
秘密鍵を途中のサーバにも持っていってくれる。
```bash
# unix
$ ssh-agent
# Windows
$ eval "$(ssh-agent)"

$ ssh-add PRIVATE_KEY_PATH
```
としておけば、`ssh -A hogehoge`すると鍵をForwardingしてくれる。
```bash
[.bash_profile]
alias sshsetup='eval "$(ssh-agent)" && ssh-add PRIVATE_KEY_PATH'
```
のようにAliasしておくと便利。パスフレーズがなければ直接`eval ~`を書いておいても良いかも。
```bash
$ ssh-agent -k
```
すると停止する。

### Alias
コマンドをショートカットできるAlias。
`~/.bashrc`か`~/.bash_profile`に書き込む。  
それぞれログイン時に読み込まれるが、bash_profileはそのユーザにログインしたとき、bashrcはそのコンソールが起動されたときに読み込まれるものらしい。  
基本的にはbash_profileに環境変数を、bashrcにaliasを書くのが推奨されているとか。  
sshに限って言えば、`.ssh/config`内に書くほうがエレガント。  
記法は以下のとおり。
```bash
$ vim ~/.bashrc

[.bashrc]
alias COMMAND_NAME="COMMAND_ALIAS"
```
+ COMMAND_NAME：そのコマンドにつけたいalias名
+ COMMAND_ALIAS：そのコマンドの実態

### function
引数を使うならfunctionを使うほうがエレガントっぽい
```bash
[.bash_profile]
function hoge_func() {
	command mkdir ~/$1
	command touch ~/$1/$2
}
# 実行例
$ hoge_func foo var.txt
$ ls ~/foo
var.txt
```
### 環境変数にproxyを設定する
profileにexportで指定する
```bash
$ sudo vim /etc/profile
...
export=http_proxy=http://172.20.253.21:8080
```
ただしここに書いただけではrootユーザ(`sudo su`)には適用されないもよう。  
加えて、exportで環境変数的にproxyを通すと、全体がproxyに向くため、内部リポジトリを読みにいけなくなることに注意。

### history
コマンド履歴を見るコマンド。
```bash
$HISTFILE	#historyが残っているディレクトリを示す

[.bash_profile]
HISTSIZE=50000	#上限を50000件に
HISTTIMEFORMAT='%Y%m$d_%H:%M:%S'	# コマンド履歴にタイムスタンプ
```

## SElinux
```bash
$ getenforce
enforced
$ setenforce 0	#disabled

$ sudo vim /etc/selinux/config
~
#SElinux=enforced
SElinux=disabled
~
proxy=hogehogehoge
```
のように書くと良いexportの際と異なり、`http_proxy`**でないことに注意**  
## Commands
### grep
検索に便利。  
`cat /hoge.log | grep foovar`みたいに検索かけるときにパイプでつなぐといい。  
```bash
$ grep MOJIRETSU PATH
ex.
$ grep hogehoge /etc/foo/var/*
```
みたいにも使える。

`grep -rnw foo * -e hoge -e test -e bar`

#### options
- `-n`:行番号を表示する
- `-r`:リカーシヴ。サブディレクトリ内も検索する
- `-w`:検索が完全一致になる

### zip / unzip
#### zip
`$ zip [-rq / -e --password=HOGE] [ZIPPED_FILE_NAME.zip] [ZIPPING_DIR_PATH]`
- r option: ディレクトリ内を再帰的に圧縮
- q option: 実行履歴を表示しない
- e option: パスワード付き書庫化。-`--password=HOGE`でパスワードを設定できる

#### unzip
`unzip [EXTRACTING_FILE_PATH]`

### crontab
#### usage
```bash
$ crontab [-uler]
```
- u: cronを実行するユーザを設定
- l: 現在のcronに設定されているリストを表示
- e: cronに登録する設定ファイルをvimで編集する
- r: 現在のcronをすべて削除する

#### files
##### cron
`crontab -e`で編集するファイルは、通常ユーザを省いてよく、ユーザごとのcronとなる。  
システム全体のcronを指定する場合は、
- `/etc/crontab`
- `/etc/cron.d`

などに書く。sudoが必要
##### log
`/var/log/cron`

### realpath
相対パスを絶対パスにしてくれる。
```bash
$ cd ~/
$ mkdir test
$ cd test
$ realpath ./
/home/CURRENT_USER/test
```

### vmstat
CPUの占有率とかを見れる。  
詳細は[vmstatコマンド](http://www.fulldigit.net/content/view/54/6/)を見る。

### iptables
`iptables -nL`

### useradd
```bash
$ useradd -c "COMMENT" -g INIT_GROPU_NAME -G ADDED_GROPU_NAME -m USER_NAME
```
- `-c`: `/etc/passwd`にコメントがつく
- `-g`: イニシャルのグループ
- `-G`: 追加の所属グループ
- `-m`: ユーザディレクトリを自動的に生成

### tail
```bash
$ tail [-n LINE_NUM] [-f] [file_path_1] [file_path_2] ...
```
#### options
- `n LINE_NUM`:LINE_NUMに任意の行数を指定することで、ファイル末尾の任意の行分を表示できる
- `f`:リアルタイム出力。logなどを見るときにつかう。`Ctrl + c`で止める。

### curl
#### options
- `x`:proxy setting
- `v`:レスポンスを表示する

#### proxyを設定する
##### ラインから設定
```bash
$ curl -x PROXY_HOST:PORT_NUM FQDN
```
##### 設定ファイルに設定
`~/.curlrc`に設定する
```bash
$ touch ~/.curlrc
$ echo 'proxy-user = "USER_NAME:PASSWORD"' >> ~/.curlrc
$ echo 'proxy = "PROXY_HOST:PORT_NUM"' >> ~/.curlrc
$ source ~/.curlrc
```

### find
```bash
$ find DIR_PATH [-name NAME]
```
#### options
- `name NAME`：一致検索。ワイルドカード可。

### ln
リンク付コマンド
```bash
ln [options] SOURCE_PATH TARGET_PATH
```
#### options
- `s`:シンボリックリンクを作成

### wc
行数をカウントしてくれる
```bash
$ wc -l hoge.foo
$ wc -l *.md	#一応ワイルドカードも使える
grep hoge | wc -l	# パイプもできる
```
#### options
- `-l`:行数をカウント
#### tips
再帰的にファイルの行数をカウント
```bash
$ wc -l $(find . -name "*.md")
```
### tree
```bash
$ tree [PATH] [OPTIONS]
# if undefined PATH, equal "."
```

|オプション|機能|
|:---:|:---|
|-a|隠しファイルやフォルダも全て表示|
|-d|ディレクトリのみ表示|
|-f|相対パスを表示|
|-h|ファイルサイズを表示|
|-u|オーナーを表示|
|-g|グループを表示|
|-L <階層>|表示する階層を指定|
|-I <ファイル名>|除外ファイル|
|--help|ヘルプ|


### nkf
文字コード変換系コマンド。
```bash
$ nkf [options] FILE_PATH [> OUTPUT_FILE_PATH]
#ex.)
$ nkf -g hoge.txt
UTF-8
$ nkf -s --overwrite hoge.txt
$ nkf -g hoge.txt
Shif-JIS
```
#### options
- `-e`:EUC output
- `-s`:Shift-JIS output
- `-w`:UTF-8(without BOM) output
- `-g`:Code difinition
- `--overwrite`:overwrite FILE_PATH without OUTPUT_FILE_PATH

### wget
ファイルダウンロード。
```bash
$ wget
```
#### proxy settings
```bash
# ALL-user
$ vim /etc/wgetrc
# one-user
$ ~/.wgetrc
[wgetrc/.wgetrc]
~
http_proxy=YOUR_PROXY:YOUR_PORT
https_proxy=YOUR_PROXY:YOUR_PORT
~
[end of file]
```
