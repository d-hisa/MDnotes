# Java Note
## ディレクトリの存在確認/生成/削除
### Imports
```java
import java.io.File;
```
### Methods
#### boolean exists()
```java
File file = new File("c:¥¥tmp¥¥newfile.txt");
if (file.exists()){
	System.out.println("ファイルは存在します");
}else{
	System.out.println("ファイルは存在しません");
}
```

#### boolean mkdir()
- 親ディレクトリが無いとfalse
- 書き込み権限がなくてもfalse（Exseptionはしない）

```java
File newdir = new File("c:¥¥tmp¥¥sub");
newdir.mkdir();
```

#### boolean mkdirs()
- 親ディレクトリが存在しなくても補間して生成

```java
File newfile = new File("c:¥¥temp¥¥sub");
if (newfile.mkdirs()){
	System.out.println("ディレクトリの作成に成功しました");
}else{
	System.out.println("ディレクトリの作成に失敗しました");
}
```

#### boolean delete()
```java
File newdir = new File("c:¥¥tmp¥¥sub");
newdir.delete();
```

### Reference
- [ディレクトリを作成する - ファイルを管理する - Java入門](http://www.javadrive.jp/start/file/index5.html)
- [ファイルの確認と削除 - ファイルを管理する - Java入門](http://www.javadrive.jp/start/file/index6.html)

## ソース内にTODOを書くTips
### やり方
コメント文で
```java
// TODO:hogehoge
```
と書くと、Taskとして認識されるので、改修箇所のメモに便利。  
Eclipseではコロンなしでも認識されるが、Xcodeとかでは無いとダメっぽいので、入れるよう意識しておく。  
あと噂ではビルドしないと反映されないとのこと。
### 見方
Eclipseでは、[Window]->[Show View]->[Tasks]で一覧できる。  
> **[Task List]でないことに注意。** こちらはこちらで、もっと詳細なTODOを書けるので、Project全体のTODOはこちらで管理するのが吉か。

### その他の特殊コメント
- **XXX** :その部分のコードが正しくないが多くの場合動いてしまう、実装がエレガントでない時に書く。
- **FIXME** :コードが間違っていて修正を要する。改修必須。
- **HACK** :リファクタリングしたほうが良さそう
- **OPTIMIZE** :パフォーマンスに影響を与えそう、処理の最適化が必要な箇所

## ゼロパディングするTips
## やりかた
2桁でintをゼロパディングする例。
```java
String.format("%02d", num);
```
Stringをゼロパディングしたかったらスペースでパディングしてreplaceをかけるらしい。詳しくはRefを。

### Reference
- [Java：ゼロ埋め、半角スペース埋めする方法 | 覚え書き.com](http://write-remember.com/program/java/format/)

## 現在時刻を取得する＆ファイル名にするTips
### 現在時刻を取得
```java
// ミリ秒で取得
long now_milli = System.currentTimeMillis();
// ナノ秒で取得
long now = System.nanoTime();
```
### 現在時刻をYYYYMMDD_HHMMSSフォーマットでString取得
```java
//timestampのフォーマット指定。今回は拡張子.pngもつける
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("_yyyyMMdd_HHmmss'.png'");
filename_t = filename + simpleDateFormat.format(new Date(System.currentTimeMillis()));
```

## Javadocでリファレンスを生成する
### やり方
[Project]->[Generate Javadoc...]  
もしくは
[File]->[Export]->[Java => Javadoc]
### [ERORR] エンコーディング MS932 にマップできません
Javadoc生成時のウィザードで`extara javadoc options`に以下を記載
```bash
-noqualifier all -encoding UTF-8 -docencoding Windows-31J
```
