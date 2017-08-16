# Vim plugins
## Introduction
Vim用のプラグインについてまとめる。  
プラグインマネージャのdeinについては[vim_dein.md](./vim_dein)を参照のこと。

## Common plugins

## For Markdown
TODO:用検証と整理
### 基本的なプラグイン
- 共通機能
	- Markdownファイルタイプの自動設定
	- 一般的なMarkdown記法のシンタックスハイライト
	- オートインデント

- plasticboy/vim-markdown
	- 主な追加機能
		- 一般的なMarkdown記法以外のシンタックスハイライト
		- LaTex math
		- JekyllやHugoで使用されているFront Matter
		- 隣接するヘッダへのモーション
		- TOC(Table of contents)の生成
		- テーブルの整形
	- Windows上で、Fenced code blockのハイライトを行う際に、少し動作が遅くなる可能性あり
- tpope/vim-markdown
	- pathogenやvim-fugitiveなど、有名なVimプラグインを数多く作っているtpope作のプラグイン
	- 特筆すべき機能なし
	- 余計な動作がない
- gabrielelana/vim-markdown
	- GitHubスタイルのMarkdownを強く意識しており、便利な機能をたくさん実装しているプラグイン
	- 主な追加機能
		- Focus Mode (Markdownファイルの中身の一部を別バッファで編集する)
		- テーブルの自動整形
		- Jekyllのファイルの自動検知と、Liquidテンプレートのサポートの自動追加
		- GitHubスタイルのチェックボックスの追加、チェック、削除
		- リストアイテムのインデント、アンインデント
- 総評
	- ある程度の処理負荷があっても便利な機能を使いたいならばplasticboy/vim-markdown
	- 最低限の機能で快適に使いたいならばtpope/vim-markdown
	- その中間ならばgabrielelana/vim-markdown

### プレビュー
| plugin | needs and dependencies     |update|
| :------------- | :------------- |:---|
|vim-instant-markdown| `npm install -g instant-markdown-d`|文字を挿入する度|
|vim-livedown| `npm install -g livedown`|書き込み時にブラウザの内容を更新|
|vim-markdown-preview|markdownもしくはgripに依存している||
|markdown-preview.vim|PythonまたはPython3サポートが有効になっている必要がある。|文字を挿入する度にブラウザの内容が更新|
|previm|外部依存がない/Markdownファイルの中でmermaid記法を使うことができる|

### その他
- vim-textobj-markdown
	- Fenced code block用のテキストオブジェクトを実装

### ref
- [Vim + Markdown - Qiita](http://qiita.com/iwataka/items/5355bdf03d0afd82e7a7?utm_campaign=popular_items&utm_medium=referral&utm_source=popular_items)
