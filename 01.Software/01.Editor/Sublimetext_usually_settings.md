# Sublime textのまとめ
## Setttings

## Packages
### Omnimarkuppreviewer

#### NOTICE
##### ERROR: 'buffer_id(\*\*) is not valid (closed or unsupported file format)'
`Ctrl` + `Alt` + `O`でプレビューしたとき、  
`'buffer_id(\*\*) is not valid (closed or unsupported file format)'`  
の404エラーを吐くとき。
###### Fix
`Preferences`->`Package settings`->`Omnimarkuppreviewer`->`Settings - User`  
に以下を追加。
```json
	"renderer_options-MarkdownRenderer": {
		"extensions": ["tables", "fenced_code", "codehilite", "toc", "footnotes"]
	}
```
- extentionsのパラメタ
	+ `toc`:`[TOC]`と入れると、目次が出る
	+ `footnotes`:脚注が使える
	+ `strikeout`:　コイツを消せば良いらしい

### Sublimerge

### SublimeLinter3
#### Installation Summary
- SublimeLinter3 Install using Pcaakge Contorol
- Linter Plugin install using Pcaakge Contorol
- Linter Install using indivisula tools

#### Common
- <kbd> Ctrl + Shift + P</kbd>
- type `install` and return
- type `sublimelinter` and return

#### for Javascript
- - <kbd> Ctrl + Shift + P</kbd>
- type `install` and return
- type `SublimeLinter-jshint` and return
- `$ npm install -g jshint`
- Restart sublime text
