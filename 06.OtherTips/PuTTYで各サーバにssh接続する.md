# PuTTYで各サーバにssh接続する
## Introduction
PuTTY使って試験環境へssh接続するメモ。
## Flow
### PuTTY Agent (Pageant)の起動と設定
まずPrivateKeyを常時持っといて、パスフレーズを一々打たないようにするPagentを起動しておく。  
ssh agentなるものと似たような仕組みらしいが、詳細はまた。

1. すべてのプログラムのPuTTYフォルダにある`Pageant`を起動
1. [Add Key]でPrivateKeyの.ppkファイルを選択
1. 設定されていればパスフレーズを入力

でOK。これで今後パスフレーズを聞かれなくなるらしい。

> #### 補足
cmdからPrivateKeyを直接設定して起動する方法もあるらしい。以下のコマンドをバッチ化すると良いかも。
`"hogehogeDir\PuTTY\pageant.exe" hogehogehogeDir\hogePrivateKey.ppk`

### PuTTYによるssh接続
#### 初期設定と踏み台サーバへの接続まで
1. PuTTYを起動（PuTTY Configurationが起動する）
1. [Category]カラムの[Session]を選び（デフォルトなら既に選ばれている）[Specify the destination you want to connect to]に以下を設定  
	+ Host Name (or IP address)：`ssh.ms.pf.goo.ne.jp`←踏み台サーバ
	+ Port:22
	+ Connection type:SSH
1. [Category]カラムの[Connection]->[SSH]->[Auth]を選び、  
[Authentication parameters]の  
	+ [Allow agent forwarding]に**チェック**←これ大事
	+ [Private ley file for authentication]に使用するPrivateKey.ppkファイルを設定
1. [Open]で接続が開始される。

> ##### 補足
[Session]->[Load, save or delete a stored session]でSaveしておくと、今後はLoadすれば設定は不要。

#### 踏み台への接続後と各サーバへの接続
PuTTYでOpenすると、`log in as:`と聞かれるので、登録されたユーザ名を打つ。今回は`hisazawa`。すると以下のように。

	login as: hisazawa
	Authenticating with public key "rsa-key-20160517-nttr-hisazawa" from agent
	Last login: Mon Jun 20 17:29:39 2016 from 202.217.72.202
	[hisazawa@xadmin-10-pro-ssh-001 ~]$

あとは任意のサーバのドメインを指定して、  
`ssh -A AnyServerDomain`
で接続できる。各サーバのドメイン等については[wiki - 砂DCステージング環境の運用について](https://fgw120.goo.ne.jp/redmine/projects/idsvc/wiki/Common1-1)を参照のこと。  
ちなみにsshの`-A`オプションは*認証エージェントの転送を許可する*というオプションらしい。おそらくAgeant forward設定と関係している。  
今回の場合踏み台を介した多段sshなので、転送を許可しない限り踏み台の先のサーバへエージェントが行かずおそらくPermition Deniedする。

## PUTTYの機能
### Logの取得
1. [Session]->[logging]の[Session logging:]の中で`printable output`を選ぶ。  
	+ printable output :見える文字だけ記録
	+ All session output :コントロール押下とか、とにかく全て記録される。読みづらい。
1. [Log_file name:]でログファイルの場所を選ぶ。  
デフォルトだとWinの管理者権限領域なので、管理者実行しないとログが残らない。  
管理者に関わりが無いhomeディレクトリのどこかに設定する。  
`C:\Users\hogehoge\document\putty.log`みたいな。
1. ログファイルに日付をつける場合は、特殊記号をつける。  
具体的には  
`C:\Users\hogehoge\document\putty_&Y&M&D_&T.log`みたいな。
1. [Whatto do if the log file already exist:]で適当なのを選ぶ。
	+ Always Overwrite it :常に上書き残らない
	+ Always append to the end of it :ログに追記されてく。重くなる。
	+ Ask the user everytime :SSH接続時に聞く。
