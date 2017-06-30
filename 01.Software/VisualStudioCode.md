# Visual Studio code
## Installation

## Settings
### 基本設定
[ファイル]->[基本設定]->[設定] or <kbd>Ctrl + , </kbd>
```json
	"editor.tabSize": "4",
	"editor.insertSpaces": true,
	"editor.renderIndentGuides": true,
	"files.autoGuessEncoding": true
```

### Use FiraCode
#### Install font
##### Mac
```bash
$ brew tap caskroom/fonts
$ brew cask install font-fira-code
```
#### Settings
<kbd>Cmd + , </kbd>で`setting.json`でを開き、下記を追加
```json
"editor.fontFamily": "Fira Code",
"editor.fontSize": 14,
"editor.fontLigatures": true,
"editor.tabSize": "4",
"editor.insertSpaces": true,
"editor.renderIndentGuides": true,
"files.autoGuessEncoding": true,
"files.eol": "\n"
```
#### Reference
[コーディング用フォント「Fira Code」を使おう - Qiita](http://qiita.com/shuntksh/items/1995e87fe5c1ac88296f?utm_source=Qiita%E3%83%8B%E3%83%A5%E3%83%BC%E3%82%B9&utm_campaign=ea92dc4aeb-Qiita_newsletter_243_18_1_2017&utm_medium=email&utm_term=0_e44feaa081-ea92dc4aeb-33166133)

## Packages
- vscode-icons
- Japanese Word Handler
- table formatter
	* `Ctrl + Shift + P`でコンソールを開き、`table`で検索し、`Current~`を選ぶとカーソルがいるところのテーブルをきれいにしてくれる。

## Usage
### Short Cuts
- Markdown Preview
	+ <kbd>Ctrl + Shift + v</kbd>
- インデント追加
	+ <kbd>Ctrl + ]</kbd>
	+ <kbd>Ctrl + [</kbd>
- オートインデント整形
	+ <kbd>Shift + Alt + f </kbd>
### コマンドラインから起動する
```bash
$ code OPEN_DIR_PATH
```
で、そのディレクトリをVScodeで開ける
