# Vimまとめ
## vim のカラーシンタックスの関連ファイルを指定する
- `~/.vim/filetype.vim`を作る。
- 上記ファイルに以下を記述
```bash
augroup filetypedetect
  au BufRead,BufNewFile *.hoge setfiletype foovar
augroup END
```
で`.hoge`ファイルに`foovar`のカラーシンタックスが適用される。らしい。

## Vimの各ディレクトリ（.vimrcの場所とか）を確認するTips
コマンドラインから、`vim -version`とすれば、ディレクトリが現れる（ハズ）
## .vimrcの設定まとめ
特にWinでｃｍｄｅｒとか使ってvimする場合には、文字化けを避けたりと必須な項目もあるので、要設定
```VimL
"--- Line Number default present ---
set number
"--- Auto indent when paste and break, etc. ---
set smartindent

"--- ForWin: Set CharCode default UTF-8 ---
set encoding=utf-8
"--- ForWin: Set file auto recognizing ---
set fileencodings=cp932,sjis,utf-8

"--- ForMac: iTerm2 enabling syntax highlight ---
set term=xterm-256color
set syntax
```
## Vimでテキストを暗号化する
暗号化前のテキストを開き、`:X PASSWPRD`として、`:wq`すると暗号化される。  
暗号化を解除するにはファイルを開いた状態で`:X`とするだけ。
