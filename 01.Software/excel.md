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
