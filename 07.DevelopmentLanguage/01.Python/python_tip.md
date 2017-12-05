# 文字列エンコードの話
## 以下のファイルを用意
# - `utf8.txt`：utf-8でエンコードされたテキストファイル
# - `cp932.txt`:cp932(shift-jis)で	エンコードされたテキストファイル
# それぞれの内容は"hoge"

## 実験内容
# 各ファイルを以下の関数で読み込む
```py
f = open("FILE_NAME","r",encoding="任意のCODEC")
```
# read関数の結果を見る
```py
f.read()
```
# 文字コードの確認はchardetパッケージを利用

## パターン
# 1):utf8.txtをopen("utf8.txt","r",encoding="utf8")でオープン	
# 2):utf8.txtをopen("utf8.txt","r",encoding="cp932")でオープン
# 3):cp932.txtをopen("cp932.txt","r",encoding="cp932")でオープン
# 4):cp932.txtをopen("cp932.txt","r",encoding="utf8")でオープン

## 結果
# 1)
hoge
# 2)
UnicodeDecodeError: 'cp932' codec can't decode byte 0x87 in position 11: illegal multibyte sequence
# 3)
hoge
# 4)
UnicodeDecodeError: 'utf-8' codec can't decode byte 0x93 in position 0: invalid start byte
