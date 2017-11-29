# git
## git for windows
### 改行コード設定
改行コード設定デフォルトだと改行コードを勝手に変換してくれる設定になっている。
```bash
$ git config --global core.autoCRLF false
```
として、編集。確認する際は
```bash
$ git config -l
```
### 日本語のエスケープ問題
初期設定では日本語のファイル名が`\nnn`の形でアスキーエスケープがかかってしまう。
```bash
$ git config --global core.quotepath false
```
とすればOK。シェルスクリプトなどでgitの設定がアレコレする場合もあるので、その時は
```bash
$ printf "$(git log --name-status)"
```
のように`printf`を通すことで対処もできる。

## ssh接続で入れるサーバにリモートリポジトリを作る
```bash
[local]
$ ssh your.remote.server
[remote]
$ mkdir /path/to/working/dir
$ cd -
$ git init --bare
$ logout
[local]
$ git clone ssh://USER_NAME@your.remote.server/path/to/working/dir
# この作業でemptyリポジトリが出来上がるので、ローカルで適当にコミットしてpushしてみる
# 他の端末やディレクトリでもCloneしてみて、反映されていればOK
# --bareで作ったリポジトリは履歴管理のみなので、ファイルの実体はないので注意
```

## Command Usage
### remote
- `add`
	* リモートリポジトリを追加する
	* usage: `git remote add REPO_NAME REPO_URL`
- `-v`
	* リモートリポジトリを一覧する
	* usage: `git remote -v`

### git rev-parse --show-toplevel
カレントディレクトリのgitリポジトリルートのパスを出してくれる。
```bash
cd $(git rev-parse --show-toplevel)
```
などをaliasしておくと便利かも。

### .gitignoreするまえにaddしてしまったら
```bash
$ git rm --cached -f foo.html~
```
### 一つ前に戻す
```bash
$ git reset HEAD FILE_NAME
```

### コミットメッセージを直したい
```bash
$ git commit --amend
```

### リモートリポジトリから新たなブランチをチェックアウトする
```bash
$ git fetch
$ git branch -a
$ git checkout -b new_branch origin/new_branch
```

### コミット間のファイル差分をみたい
```bash
$ git diff --stat --name-only COMMIT_ID_A COMMIT_ID_B
```

### 特定のファイルをあるコミットに戻す
```bash
$ git checkout COMMIT_NO FILE_PATH
# ex.)
$ git checkout HEAD hoge.txt
```

## .gitignore
gitに紐付けないファイルを指定する。
- 無視設定を行いたいフォルダに .gitignore という名前でテキストファイルを作成する。
- 無視したいファイルを下のパターンをもとに .gitignore 内で指定する。
- 設定の有効範囲は .gitignore ファイルの有るフォルダ内全部。
- リポジトリのルートにある必要はなく、リポジトリ内に複数あってもよい。

[gibo](#gibo)を利用すると良いらしい。

### .gitignoreを設定する
- 任意のディレクトリに`.gitignore`ファイルをつくる。  
`$ touch .gitignore`
- 深い階層の方が優先される。

### .gitignoreの設定方法
#### コメント
"¥#" で始まる行はコメント
#### 特定の拡張子を無視する
```bash
# exe ファイルは要らない
*.exe
```
#### 特定のフォルダの中身全てを無視する
```bash
# bin フォルダは要らない
bin/
```
#### 特定のパターンを無視しない
```bash
# nuget.exe は必用なファイル
!/.nuget/nuget.exe
```
#### フォルダ内の特定拡張子を無視
```bash
# パッケージフォルダ内の .ts ファイルは要らない
package/**/*.ts
```
### Reference
- [.gitignore の書き方 - Qiita](http://qiita.com/inabe49/items/16ee3d9d1ce68daa9fff)

## Tools
gitで使える便利なツールたち
### tig
#### Installation

### gibo
####  Installation
<div style="background-color: #c33; padding: 5px">
<img src="../99.images/icon_windows_bkc.png" width="20"> <strong>Windows</strong>
1. 任意のディレクトリへ
	+ `$ cd /install/dir/path`
	+ Cmderなら`/usr/bin`とか
1. Cloneする
	+ `$ git clone https://github.com/simonwhitaker/gibo.git`
1. PATHを通す
	+ `export PATH=$PATH;/install/dir/path/gibo`
</div>

<img src="../99.images/icon_mac_bkc.png" width="20"> <strong>Mac</strong>
1. hombrewでOK
	+ `$ brew install gibo`

#### Usage
- バージョン表示
	+ `$ gibo -v`
- テンプレートファイルアップデート
	+ `$ gibo -u`
	+ これで`~/.gitignore-boilerplates`が生成される
- 利用可能な種類の表示
	+ `$ gibo -l`
- .gitignoreを生成
	+ `$ gibo [Language/Framework]`
	+ ex.)`gibo java Eclipse`
	+ 標準出力なので、実使用する場合はリダイレクト
		* `$ gibo java > .gitignore`
