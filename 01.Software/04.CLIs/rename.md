# rename
## Introduction
ファイル名変更コマンド。`mv`だけでは物足りない時に。

## Installation
### Mac
```bash
brew install rename
```

## Usage
```bash
$ rename FROM TO FILE
```
- FROM:置換前文字列
- TO:置換後文字列
- FILES:対象ファイル。ワイルドカードで複数指定OK。

### 別の指定の仕方
```bash
$ rename 's/FROM/TO/;' FILES
```
こっちだと、文字を消すことができる（上のだと引数の数が合わなくなる）

### 注意
```bash
$ rename 's/\.mp3/\.mp4/;' files
```
拡張子を変更する際はドットの前にバックスラッシュを入れてエスケープが必要。
