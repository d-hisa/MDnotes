# InkScape
## Introduction
ベクタ画像を扱うためのソフトウェア。GUI版もあるが、主にSVG2PNGとかに使いたい。
## Installation
```bash
# Windows
$ cinst InkScape
# Mac
$ brew cask install inkscape
```

## Usage
```bash
$ inkscape /fullpath/to/inputfile -M /fullpath/to/outputfile
```
フルパスで指定する必要が有ることに注意。
```bash
$ cd work_dir
$ inkscape $(pwd)/inputfile -M $(pwd)/outputfile
```
などでもOK。

| Options | Desc. |
| :------------- | :------------- |
| -M   | to EMF|
