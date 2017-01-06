# git
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

### Reference
- [.gitignore の書き方 - Qiita](http://qiita.com/inabe49/items/16ee3d9d1ce68daa9fff)
