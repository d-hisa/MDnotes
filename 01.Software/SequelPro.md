# Sequel Pro
## Instroduction

## Installation
<img src="../99.images/icon_mac_bkc.png"><strong>Mac</strong>
- [公式サイト](http://www.sequelpro.com/)からDL
- もしくは **Homebrew** でOK
	* `brew cask install sequel-pro`

## Settings
起動後、以下のパラメタで接続
### ローカルの場合

### SSHの場合
#### 踏み台を経由する場合
| Client | Host:A  | Host:B|
| :--- | :------ |:--|
|Mac(SequelPro)|踏み台鯖|MySQLのある鯖|

みたいな場合
##### .ssh/config
```py
# Host Aの設定
Host humidai
	HostName HUMIDAI_HOST_IP_OR_DOMAIN
	IdentityFile /your/id/file/path
	User LOGIN_HUMIDAI_USER_NAME
	ForwardAgent yes
# Host Bの設定
Host HostBname
	HostName HOSTB_IP_OR_DOMAIN
	IdentityFile /your/id/file/path
	User LOGIN_HOSTB_USER_NAME
	ForwardAgent yes
	ProxyCommand ssh humidai -W %n:%p
```
##### 設定パラメタ
SSHタブを選び、

|名前|パラメタ|該当オプション|
|--:|:--|:--:|
|名称|適当につける名前|-|
|MySQLホスト|HostBのIPHONEかドメイン|`-h`|
|ユーザ名|MySQLにログインする際のユーザ名|`-u`|
|パスワード|MySQLにログインする際のパスワード|`-p`|
|データベース|オプション。DBを指定して接続|`-D`|
|ポート|デフォルト（無指定）は3306|-|
|SSHホスト|踏み台のホスト名を入れる|-|
|SSHユーザ|踏み台に入るSSHのユーザ名|-|



## Usage

## Reference
- [MySQL管理ソフトのSequel Pro入門 - TASK NOTES](http://www.task-notes.com/entry/20150131/1422699221)
