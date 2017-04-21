# Shellscript and bash
## Shellscript
### 実行をデバッグする
```bash
$ /bin/bash -x ./hoge.sh
```
のように、`-x`オプションを付けて実行する

## bash technics
### Alias
いわゆるコマンドショートカット。引数指定もできるがあまりエレガントではないとか。
```bash
$ echo 'alias hoge="任意のフルコマンド"' >> ~/.bash_profile
# example
$ echo 'alias ls="ls -color"' >> ~/.bash_profile
# confirm
$ tail -n 1 ~/.bash_profile
alias ls="ls -color"
```
`.bash_profile`のほかに`.bashrc`などでもよい。
### Function
引数付きでよしなにした場合、こっちのがエレガント？らしい。  
Shellscript的にも同じような書き方になるので、勉強も兼ねて実装しよう。
```bash
# bash_profile に関数を書く
function moveTKMKdir(){
	command mv $1 $HOME/m-taka/test/$1
}
## 使い方
### 例えばカレントディレクトリに hoge.txt があるとき、
$ moveTKMKdir hoge.txt
### とすると、
mv hoge.txt $HOME/m-taka/test/hoge.txt
### と同じ動作をする関数を定義できるよ
```

## 特殊変数
### $0 ~ $9
- `$0`:プログラム名
- `$1~$9`:プログラムの引数

### $@ / $*
引数の個数

### $?
直前の計算結果の成否を返す。成功なら`0`、失敗なら適当な戻り値を返す。

# 複数行コメントアウト
```bash
<< commentout	# 任意の文字列
hoge
foovar
commentout
```
でhogeとfoovarはコメントアウトされる
