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

## 環境変数にproxyを設定する
profileにexportで指定する
```bash
$ sudo vim /etc/profile
...
export=http_proxy=http://172.20.253.21:8080
```
ただしここに書いただけではrootユーザ(`sudo su`)には適用されないもよう。  
加えて、exportで環境変数的にproxyを通すと、全体がproxyに向くため、内部リポジトリを読みにいけなくなることに注意。
