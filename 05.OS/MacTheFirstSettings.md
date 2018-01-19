# Macの初期設定
をがっつりめもしながらやってみる
## やることリスト
- [ ]:GoogleIMEを入れる
- [ ]:Mac本体の初期設定を行う
- Homebrewをインストール
- 各種ソフトウェアのインストールとセットアップ
- 開発環境のセットアップ
    - gitの初期設定
    - gitの最新化
    - Terminal環境の構築
    - sshセッティング
    - Anacondaの導入
    - Composerの導入
    - VisualStudioCodeのセットアップ
    - SublimeTextのセットアップ
    - Atomのセットアップ
    - Keynoteのセットアップ

## Google日本語入力のインストール
ことえりに殺意を覚えるのでGoogle日本語入力を入れる
と思ったけどライブ変換が思ったより優秀になっているのでこのままで行ってみる
### やる場合
[Google日本語入力のページ](https://tools.google.com/dlpage/japaneseinput/eula.html?platform=mac)からインストーラをDLしてインストール
## Mac本体の初期設定
### 電池の表示を切り替える
トップバーの電池マークをクリックし、`割合(%)を表示`を有効にする
### Dockの余計なアプリを消す
Dockで使わないアプリをサブクリックで削除する
### 隠しフォルダを表示する
Finder上で  
<kbd>Cmd</kbd>+<kbd>Shift</kbd>+<kbd>.</kbd>をたたく

### システム環境設定編
- システム環境設定
    + Dock
        * `画面上の位置`を`左`に設定
    + Mission Control
        * `最新の利用状況に基いて〜`のチェックを外す
        * これをしておかないと仮想デスクトップの順番をよしなにされてしまう
    + ディスプレイ
        * `輝度を自動調節`のチェックを外す
    + 省エネルギー
        * バッテリー
            - `ディスプレイをオフにするまでの時間`を`5分`に設定
    + トラックパッド
        * ポイントとクリック
            - `タップでクリック`を有効に
        * スクロールとズーム
            - `スクロールの方向：ナチュラル`を無効に
        * その他のジェスチャ
            - `フルスクリーンアプリケーション間をスワイプ`を`４本指で左右にスワイプ`に変更
            - `アプリケーションExpose`を`３本指で下にスワイプ`に設定し、有効に
    + キーボード
        * キーボード
            - `F1,F2などのキーを標準のファンクションキーとして使用`を有効に
            - `修飾キー`をクリック
                + <kbd>CapsLock</kbd>キーを<kbd>Esc</kbd>に設定する
        * ショートカット
            - フルキーボードアクセスを`すべてのコントロール`へ変更
            - これで<kbd>tab</kbd>でフォーカス切り替え、<kbd>Space</kbd>でフォーカスを押下
        * 入力ソース
            - 入力モード：半角カタカナにチェック
            - `Windows風のキー操作`にチェック
    + Siri
        * `"Siriに頼む"を有効にする`を無効に
        * `メニューバーにSiriを表示`を無効に
    + アクセシビリティ
        * `操作` - `マウスとトラックパッド`
            - トラックパッドオプション
                + `ドラッグを有効にする`を有効に
                + `3本指のドラッグ`に設定
        * `ズーム機能`
            - `スクロールジェスチャと修飾キーを使ってズーム：` - `Command`

## Homebrewを入れる
### Command Line Tools
- `Xcode`が入って入れば不要
- Xcode経由で入れた場合、Xcodeを起動してライセンスを一旦許諾する必要がある
    + `sudo xcodebuild -license`
    + でライセンス規約を読み、CLI上からAgreeすることも可能
- 最近のbrewインストールスクリプトはこのCLTを勝手に取りに行ってくれるっぽいので、明にやらなくてもいいかも

### Homebrewのインストール
[公式ページ](https://brew.sh/index_ja.html)にあるコマンドを叩く。一応下記に示す。
```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew update
$ brew upgrade
$ brew doctor
# ERRORが出なければOK
```

## 各種ソフトウェアのインストールとセットアップ
### CLIコマンド系
brewで入れられものは大体入れる（依存パッケージは除外）
- composer
    - phpのパッケージマネージャ
- exa
    - リッチなls
- gibo
    - .gitignoreをプラットフォームごとによしなにしてくれるやつ
- git-flow
    - git-flowのプラグイン
- gradle
    - Java用ビルドパッケージ
- graphviz
    - 図形描画ライブラリ。PlantUMLとかに必要
- imagemagick
    - 画像変換ライブラリ
- lnav
    - lessライクにログファイルをリッチにみれるやつ
- mas
    - AppStoreで入れるアプリをマネージしてくるやつ
- nkf
    - 文字コード変換コマンド
- node
    - Node.js
- pandoc
    - ドキュメントをいろいろやるやつ。PlantUMLとかMarkdownとかに必要
- peco
    - コマンドスニペット的なやつ
- phantomjs
    - ヘッドレスブラウザ。Seleniumとかに必要
- tig
    - CLIでリッチにgit管理するコマンド
- tmux
    - マルチSSHクライアント
- tree
    - ファイルディレクトリをツリービューするコマンド
- w3m
    - CLI用テキストブラウザ
- wget
    - ファイルダウンローダ
```bash
$ brew install tig wget tree
```

### brew caskでインストール出来るもの
brew caskで入れられるものはとりあえずcaskで入れちゃう。
- Browser
    - google-chrome
    - firefox
- Editor
    - atom
    - visual-studio-code
    - sublime-text
- Utilities
    - alfred
    - qlmarkdown
- Development Utils
    - slack
    - xmind
    - sourcetree
    - sequel-pro
    - virtualbox

### その他のインストール
重めののとか、あんなまりポータビリティを考えなくて良いものは普通に入れる
#### IDE
- Android Studio
    - [Android Studio Install](https://developer.android.com/studio/install.html)
- Xcode
- Eclipce

### 各ソフトウェアセットアップ
- Alfred
    - 一度起動する
    - `Alfred Preferences`が起動（しなければメニューバーから）
    - `Alfred Hotkey`を`ctrl double tap`へ変更

## 各種開発環境セットアップ
### Gitの初期設定
#### Init
```bash
$ git config --global user.name "HOGE"
$ git config --global user.email "FOO"
$ git config --global core.autocrlf=false
```
### gitの最新化

### Terminal環境を整える
#### dotfileを整備
- .bash_profile
- .ssh
- .vim
- .vimrc

#### Terminalの見た目を整える
- zshをいれる
- Powerlineを導入
- 表示文字の設定
- 

### sshセッティング
前のPCから秘密鍵をコピっておくこと
```bash
$ mkdir ~/.ssh
$ chmod 700 ~/.ssh
$ cp /path/to/privatekey ~/.ssh/
$ chmod 644 ~/.ssh/config
$ chmod 600 ~/.ssh/privatekey
```

