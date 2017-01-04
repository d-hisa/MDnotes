# git関連の使い方とか
## 初期設定
### Proxy
```bash
$ git config --global http.proxy http://proxy.example.com:8080
$ git config --global https.proxy http://proxy.example.com:8080
```
### User profile
```bash
$ git config --global user.name "Hogehoge"
$ git config --global user.email "hogehoge@hoge.co.jp"
```

## 基本的な流れ
```bash
# 作業ディレクトリに異動
$ cd WORKING_DIR
# 既存リポジトリからリポジトリをクローンする
$ git clone GITHUB_URL
# リポジトリディレクトリに移動
$ cd REPOS_TITLE
# ファイルをよしなに編集
$ vim hoge.txt
# 編集したファイルをインデックスに追加
$ git add hoge.txt
# 編集したファイルをコミット
$ git commit -m "HOGE_COMMIT_COMMENT"
# コミットしたものをプッシュ
$ git push
$ git push origin master:master
```

## githubを使う
### 既存リポジトリからcloneしたい

## コマンドユースケース
### git add
- `git add --all` / `git add -A`　などで一括ADDできる

### Merge
