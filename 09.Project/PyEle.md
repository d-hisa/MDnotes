# Python X ElectronでGUIアプリを作る
## 試す環境
- Python
- Flask
- Electron

でやってみる

## 環境構築
### Pythonのセットアップ
```bash
$ conda --version
# 今回はすでにminicondaを構築済みなのでスキップ
```

### Flaskのセットアップ
```bash
$ pip install Flask
```

### NodeJSのセットアップ
```bash
# 入ってないことを確認
$ node --version
# インストール
$ brew install nodebrew
# インストールされたことを確認
$ nodebrew --version
# 最新版nodeをインストール
## ディレクトリが無いとエラーを吐くので作ってから実行する
$ mkdir -p ~/.nodebrew/src
$ nodebrew install-binary latest
# インストールしたnodeをアタッチする
## 確認
$ nodebrew list
v*.*.*
current:none
## アタッチ
$ nodebrew use v*.*.*
use v*.*.*
# PATHを通す
[.bash_porofile]
export "PATH=$PATH:$HOME/.nodebrew/current/bin"
[EOF]
# 正常なインストールを確認
$ node -v
$ npm -v
```

### Electronのセットアップ
```bash
$ npm install -g electron-prebuilt
```

### Pythonアプリの構築準備
```bash
$ cd /path/to/work/dir
## gitなら
$ gibo Node > .gitignore && gibo Python >> .gitignore

$ mkdir pythonApp
$ cd pythonApp
$ npm init -y
```