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

## .gitignore
gitに紐付けないファイルを指定する。
- 無視設定を行いたいフォルダに .gitignore という名前でテキストファイルを作成する。
- 無視したいファイルを下のパターンをもとに .gitignore 内で指定する。
- 設定の有効範囲は .gitignore ファイルの有るフォルダ内全部。
- リポジトリのルートにある必要はなく、リポジトリ内に複数あってもよい。

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

## リモートリポジトリから新たなブランチをチェックアウトする
```bash
$ git fetch
$ git branch -a
$ git checkout -b new_branch origin/new_branch
```

## 特定のファイルをあるコミットに戻す
```bash
$ git checkout COMMIT_NO FILE_PATH
# ex.)
$ git checkout HEAD hoge.txt
```


### Reference
- [.gitignore の書き方 - Qiita](http://qiita.com/inabe49/items/16ee3d9d1ce68daa9fff)
