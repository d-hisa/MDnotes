# Slack terminal-clientを入れてみる
## セットアップ
### Node.jsのインストール（mac編）
前提環境であるnodeを入れる。公式からインストーラで入れたりcurlで入れたりといろいろやり方があるらしいが、今回はbrewで入れる。
```bash
# これでnodeも一緒にインストールされる
$ brew install npm
# npmで不足モジュールを一括インストールしてくれるコマンドを導入
$ npm install -g npm-install-missing
# npm-install-missingを実行
$ npm-install-missing
```
### Node.jsのインストール（win編）
winではchocolateyでnodeを入れてみる。
```bash
chocolatey install nodejs
chocolatey install npm
npm -g config set proxy http:proxy.hoge.jp:8080
npm -g config set https-proxy http:proxy.hoge.jp:8080
npm -g config set registry http://registry.npmjs.org
```

### SlackのAPItokenを払い出して環境変数へ（Mac編）
ログイン後、[Slack Web API | Slack](https://api.slack.com/web)より、tokenを払い出す。
tokenを`bash_profile`へ
```bash
# 追記
$ vim ~/.bash_profile
[export SLACK_TOKEN="払い出したslackのtoken"]
$ source ~/.bash_profile
```

### 本体を拾ってきて作動させる
今回は`/usr/local/bin`配下に設置。
```bash
$ cd /usr/local/bin
$ git clone https://github.com/evanyeung/terminal-slack.git
$ cd terminal-slack
$ node main.js
```
### 設定ファイルの変更
このままだと日本語が文字化けするので、ユニコードに対応させる。
```bash
terminal-slack/userInterface.js
```
を修正する。
```js
var screen = blessed.screen({
    autopadding: true,
    smartCSR: true,
	title: 'Slack',
	fullUnicode: true	//これを加える
}),
```
#### ref
- [unicode and docker support by alu · Pull Request #5 · evanyeung/terminal-slack](https://github.com/evanyeung/terminal-slack/pull/5/commits/a062908cd102e7e3642abd6c18b2046d59c7f202)

## 使い方
- `Ctrl + u`:ユーザ一覧にフォーカス
- `Ctrl + c`:チャンネル一覧にフォーカス
- `Ctrl + l`:表示中のメッセージリストにフォーカス（カーソルキーで文字送りができる）
- `Ctrl + w`:コメント欄にフォーカス。メッセーリストから戻る時に使う
- `Esc`:終了する

## 注意点
- 本家クライアントでポストするとコンフリクトして死ぬ
- 未joinのチャンネルを開くと勝手にjoinする
- 改行はできない・画像も出ない・リアクションもできない　などリッチな機能は皆無

## Reference
- [evanyeung/terminal-slack: Terminal client for slack](https://github.com/evanyeung/terminal-slack)
-
