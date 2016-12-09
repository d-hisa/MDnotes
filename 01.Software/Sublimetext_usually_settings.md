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
