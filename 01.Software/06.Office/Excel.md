# Excel

## Functions

### ISERROR
#### Usage
```excel
ISSERROR(実行したい関数)
```
#### Return
TURE / FALSE
### IFERROR

## Tips
### ダブルクォーテーションを表示させる方法
ダブルクオーテーションを囲めば良いらしい。
```excel
="hoge"""foovar""" "
hoge"foovar"
```
### 日付をフォーマッティングしたい
text関数を使う。
#### 今日の日付
```excel
=TEXT(TODAY(),"yyyymmdd")
20161225
```
### ランダムパスワードを生成

|-|A|B|
| :------------- | :-------------: |:---:|
|1|素材文字列|123...90abc...xyzABC...XYZ|
|2|文字列長さ|62|
|3|生成PW|fKMfnDOR|

```
[B2]
=LENB(B1)
[B3]
=CONCATENATE(MID($B$1,(RANDBETWEEN(1,$B$2)),1), ...
↑任意の桁数分MIDを繰り返す
```

## 特定の条件で列に色を付ける
- 条件付き書式で`新規新規ルール`-`ルール数式`
	+ 数式：`=$X1="HOGE"`
		* `X`はプルダウンの列
		* 行番号はかならず１にする
		* `HOGE`はプルダウン指定文字列
	+ 書式：任意
	+ 適用先：`=$A:$J`
		* `A`と`J`：適用したい列の範囲
