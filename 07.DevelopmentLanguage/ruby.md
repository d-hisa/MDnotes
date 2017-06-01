# Ruby
<<<<<<< HEAD
## RDoc
Ruby用のドキュメント作成ソフト。
最近のRubyには標準搭載？らしい
=======
## Settup
### Windows
```bash
# ChocolateyでRubyとGemをインストール
$ cinst ruby ruby2.devkit
```

>>>>>>> f5b70a1a78b63f4a6410830d0588312ad224be9c

## Tips
### コメントアウト
```rb
# シャープで一行コメントアウト
=begin
複数行のときは囲む
これらの前にインデントがあると死ぬので注意
=end
```

### スクリプトを途中で止めたい
exitメソッドを使う。
```rb
exit(0)
```
<<<<<<< HEAD
exitの引数は終了時のコード
=======
exitの引数は終了時のコード

### 例外処理したい
```rb
def hogehoge
	shori1()
	begin
		reigai_desouna_shori
	rescue => e
		reigai_detatoki_shori
		puts e	#例外の内容を出す
	end
end
```
>>>>>>> f5b70a1a78b63f4a6410830d0588312ad224be9c
