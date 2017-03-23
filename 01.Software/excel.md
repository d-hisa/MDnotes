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
