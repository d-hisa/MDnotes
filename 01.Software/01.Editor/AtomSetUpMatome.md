# Atom Set Up (Special thanks Takamiki)
## Install(Win / Mac)
- Atomの[公式ダウンロード](https://atom.io/)

### Win
exe落としてダブルクリックで終わり。  
インストール先の実態は  
`C:\Users\USERNAME\AppData\Local\atom\Update.exe --processStart atom.exe`

## Basic Settings
### 日本語化（今回はしない）
[Preferences] > [install] からjapanese-menuをインストール

### 設定を変更
[File]->[Settings]->[Settings]より

- [フォント](http://jikasei.me/font/rounded-mgenplus/)を以下へ変更
	- Windows
		- "Rounded-L Mgen+ 1pp medium"
	- Mac
		- "Rounded-L Mgen+ 1pp light"
- [Show Indent Guide]->on
- [Show invisibles]->on
- [Soft Wrap]->on
- [Tab Length]->4
- [Tab Type]->hard

### Proxy Settings
proxyを通している場合、Atomがパッケージのリポジトリを見に行くためにProxy設定が必要
#### apmファイルを置く
+ 以下の`.apmrc`ファイルを新規作成し、.atom配下へ  
※proxyのアドレスは適宜変更のこと
```bash
https-proxy = http://proxy.nttr.co.jp:10000/
http-proxy =  http://proxy.nttr.co.jp:10000/
strict-ssl = false
```
> ##### .atomの場所
Windows:`C:\Users\USERNAME\.atom`  
Mac:`hoge `

#### PATHを通す
* **Windwos:** 管理者権限のコマンドプロンプトで以下を実行  
`setx ATOM_NODE_URL http://gh-contractor-zcbenz.s3.amazonaws.com/atom-shell/dist /M`  
[成功。指定した値は保存されました。]となればおｋ
* **Mac:** `~/bash_profile`に以下を追記  
`export ATOM_NODE_URL=http://gh-contractor-zcbenz.s3.amazonaws.com/atom-shell/dist`

### パッケージ
[File]->[Settings]より
#### パッケージの無効化
[Packages]->[Core Packages]より

- [spell-check]->disable

#### パッケージの追加
[Install]より

- autocomplete-paths
- file-icons
- highlight-line
- highlight-column
- highlight-selected
- minimap
- atom-beautify
- sync-settings
- color-picker
- sublime-Style-Column-selection(highlight系と相性悪い)
- autoclose-html
- pigments
- Line Ending Converter(改行コードのデフォルトを指定)  
->設定でデフォルトをCRLFに
- atom-html-preview
- 同期について
- git-plus
	+ gitコマンドをAtomから叩ける
	+ 使い方
		* `ctrl + shift h`:でコンソールを開き、使いたいコマンドを一覧から選ぶ
		* githubアカウントの設定の仕方がよくわからない。
		* なんか既知のバグっぽい？
- markdown-preview-enhanced
	+ [【ドキュメントが書きたくなる】Markdownライブプレビュー + インライン数式/UML/図表 + 綺麗にPDF/Wordエクスポートまで - Qiita](http://qiita.com/tomo_makes/items/da4e8fe7d8cf168b545f)

## 起動が重いとき
`ctrl + shift + p`でコンソールを開き、`timecop view`するとパッケージごとの所要時間がでるので問題の切り分けに

## Editor is not respondingが継続する時
```bash
$ atom --clear-window-state
```
するとよくなるかも。

## References
- [1](http://webmem.hatenablog.com/entry/how-to-synchronize-Atom-settings-by-sync-settings)
- [2](http://qiita.com/T_M/items/0fb0804eb1fd256aac4e)
- [3](http://qiita.com/megmogmog1965/items/7613267d7e7a677a5d8a)
