# tmux
## Introduction
端末仮想化ツールらしい。  
内部的にセッションを保持して仮想的な端末を作り出すので、複数ペイン表示に対応していないターミナルエミュレータで複数ペイン表示できたり、まあ色々便利らしい。
## Technical term
- プレフィックスキー
	+ tmuxで何かショートカットをするときのおまじない
	+ デフォルトでは`Ctrl + b`で、`C-b`のように表記される。
- セッション：起動した仮想端末全体
- ウィンドウ：セッション内の画面単位
- ペイン：ウィンドウを分割した単位

## Install
### CentOS7
```bash
$ yum install tmux
```
### Mac
```bash
$ brew install tmux
```

## Usage
### 起動
```bash
$ tmux
$ tmux new-session #でもおｋ
```
###  ペイン分割と移動
複数ペイン使いたいだけならこれだけ覚えてればOK
#### Pain Split
- Vertical split : `C-b + "` = `C-b + (shift + 2)`
- Horizontal split : `C-b + %` = `C-b + (shift + 4)`

#### pain move
`C-b + o`
#### pain scroll
`C-b [`でスクロールモード。PageUp/Downとカーソルキーが使える。  
`q`で通常モードへ。

### セッションのデタッチ（終了）
`C-b + d`
