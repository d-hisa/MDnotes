# 多段SSHでapacheのhtmlアクセスする

## Socksプロキシを設定する方法
### Step1:トンネルを張ってSSH踏み台にアクセスする
- PuTTYを起動
- [Session]でssh接続の登録済み設定をLoadする
- [SSH]->[Tunnel]
- Source Portをhightportに設定(ex.20202)
- DestinationをDynamicに設定
- Addして、上のテキストボックスに`D20202`が追加されていることを確認
- [Session]に戻り設定を別名でSave
- Open

### Step2:webブラウザを設定したポート(トンネル)に対してパケットを投げるように設定する
- FireFoxを使用
- ブラウザ右上のハンバーガーメニューから[オプション]->[詳細]->[ネットワーク]->[接続]を選択
- 手動でプロキシを設定するを選択
- SOCKSホストに`localhost`と、ポート`20202`を入力
- [プロキシなしで接続]に`localhost,127.0.0.1`を入力

### Step3:http接続
- firefoxのアドレスバーに`http://IP_ADDR/HOGE_FILE/`と打ち込み検索  
	+ IP_ADDR: 接続するサーバのIPアドレス
	+ HOGE_FILE: 接続先サーバのApacheのDocumentRoot\*に配したファイル  
	`ex. http://111.111.11.1/index.html`  
	\*DocumentRoot: `/var/www/html`
- `IP_ADDR`はサーバで`ifconfig`すればよい

## IPリスト
|ServerName|IP|
|---|---|
|ikusei-10-pro-aweb-001|172.20.156.17|  
|ikusei-10-pro-adb-001|172.20.156.19|
|ikusei-10-dev-web-003|172.20.156.7|
