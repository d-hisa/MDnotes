# Ruby
## RDoc
Ruby用のドキュメント作成ソフト。
最近のRubyには標準搭載？らしい
## Settup
### Windows
```bash
# ChocolateyでRubyとGemをインストール
$ cinst ruby ruby2.devkit
```
### Mac
- `rbenv`をつかう

```bash
$ brew install rbenv
$ rbenv --version
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
$ source ~/.bash_profile
$ rbenv install --list
$ rbenv install *.*.*
$ rbenv global *.*.*
$ rbenv versions
$ ruby --version
$ gem update
```


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
