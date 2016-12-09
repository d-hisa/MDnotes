# VBことはじめ
VBにCentOSを放り込むときにいつもやる設定
## VBのインストール
公式ページからDL
## CentOS7の入手
公式ページからDL。minimumが早い。Fullだと8GBちかくある。
## VBでVM立ち上げ
VBで[新規]して、あとはポチポチNextを押す作業
## VBの初期設定
VB側の[環境設定]を選び、ネットワークの二個目にホストオンリーアダプタを追加する。
## CentOSをインストール
- VMの環境設定さわり、インストールメディアを先にDLしてｋちあisoファイルへ設定。
- あとはチャートにしたがってインストール
- 途中、インストールドライブを聞かれるけど、一度選択後、左上の完了を押せば良い
- 途中rootパスワードとユーザを作る場面があるので、作っておく
	+ rootパスワード：だいたいいつもroot
	+ ユーザID：centos
	+ ユーザPW:root
	+ このユーザを管理者にするにチェックを入れておく

これでだいたいおk
## CentOS7にsshで接続する
CentOSのVMを起動した後、ログインして`nmtui`コマンドでNetworkManagementToolを起動。
### enp03s
- IPv4をAutomatic
- IPv6をIgnore
- 一番下のチェックボックスを両方Trueに。スペースキーでEnableできる。

### enp08s
- IPv4をManualに
	+ IP ADDRを`192.168.56.111/24`としておく

あとはだいたい03と一緒
### NOTICE: Macでsshするとき
Macでは、初期設定では自身に対するリモートアクセスを許可していない。  
そして、VMも実は「自身」に含まれるということらしい。  
`[システム環境設定]->[共有]->[リモートアクセス]` のチェックを入れると一応通るようになるっぽい。

## 共有フォルダの設定
ゲストとホストの間に共有フォルダをつくる。
```bash
#ここでは仮に以下の様なディレクトリとする
C:/User/USER_NAME/VBsync
```

### ホスト設定
1. 適当な場所に共有用ディレクトリを作る
1. 共有したいVMの **設定** を開き、 **共有フォルダ** タブの **フォルダリスト** のフォルダアイコンを選択し新規作成
	+ [フォルダーのパス]->[その他]で共有用ディレクトリを指定
	+ [自動マウント]と[永続化する]にチェック

### ゲスト設定
1. ゲストOSを起動し、VMのメニューバー（VM本体ではない）の[デバイス]->[共有フォルダーを設定]を選択
> このとき、 **GuesAddtionsが必要です** というアナウンスが出た場合、下記の *GuestAddtionのインストール* へ

1. 【要確認】ホスト設定のときと同じことをするが、必要か？
1. ゲストOSにログインし、`/mnt`配下にホスト側で設定したものと同じディレクトリを作成し、マウントする
```bash
$ sudo mkdir /mnt/VBsync
$ sudo mount -r vboxsf VBsync /mnt/VBsync
```

これで共有フォルダが設定された。

### Guest Addtionのインストール(CentOS)
#### 前提パッケージの導入
CentOSの場合、以下の前提パーッケージが必要なのでインストールする。
```bash
$ yum install kernel-devel make gcc
```
#### GuestAddtion.isoのマウントとインストール
- ゲストOSのVMメニューバーの[デバイス]->[Guest Addtions CD イメージの挿入]
>このとき、マウントできない旨のエラーメッセージが出た場合、下記の *マウントできないとき* を参照。普通は何も出ない。

- ゲストOSにログインし、GuestAddtionのディスクをディレクトリにマウントする
	+ マウントしたら内部の`VBoxLinuxaddtions.run`を実行
```bash
$ sudo mkdir /mnt/cdrom	#マウント用ディレクトリの作成
$ sudo mount -r /dev/cdrom /mnt/cdrom
$ cd /mnt/cdrom
$ sudo sh ./VBoxLinuxAddtions.run all
```
これでOK。

##### マウントできないとき
- ゲストOSをシャットダウン
- VBよりゲストOSの設定を選び、[ストレージ]タブの中にある **コントローラ：IDE** 配下の **VBoxguestAddtions.iso** を選ぶ
- その右パネルの属性の右側にあるCDアイコンを押し、リストの中から **仮想ドライブからディスクを消去** を選択
- ゲストOSを再起動し、Guest Addtions Cd イメージの挿入をやり直す

## ストレージが足りなくなったときのTips
ストレージが足りなくなったら、領域を拡張しよう。
### VBoxManageのエイリアス
ストレージの変更は、VBoxManageという設定ツールを使う。  
通常はPATHを通すが、今回はAliasで対応。

```bash
C:/"Program Files"/Oracle/VirtualBox/VBoxManage.exe
```
としよう。  
**なお、上記のパスはシンタックスを回避するためにスラッシュ区切りになっているので、￥に読み替えて記述する必要がある。**

### 設定
#### ディレクトリの確認
VMの[設定]->[ストレージ]->[情報]欄にある **場所** をメモ
#### 増やす
> ディスク形式が`vmdk`の場合、vdiへ変換が必要。  
> `VBoxManage clonehd "hoge.vmdk" "hoge-clone-disk.vdi" --format vdi`

- `VBoxManage showhdinfo hoge.vdi`で容量を確認。
- `VBoxManage modifyhd hoge.vdi --resize 20480`で容量増加。これは20GBに増やしている
- `VBoxManage showhdinfo hoge.vdi`で容量を再度確認。

#### ディスクを差し替える



## Reference
- [【virtualbox】Guest Additionsインストール方法【centos】](http://mpweb.mobi/windows/guestadditions-centos.php)
- [VirtualBox で解像度の調整： Guest Additions のインストールができない - x76789の研究メモ](http://d.hatena.ne.jp/x76789/20131002/1380664591)
- [Guest Additionsのインストール | VirtualBox Mania](http://vboxmania.net/content/guest-additions%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)
- [【 Virtual Box 】共有フォルダを介して、ホストOS(Windows 7) と ゲストOS(Debian/ MathLibre)でファイルやりとりするための設定 - Qiita](http://qiita.com/HirofumiYashima/items/6044cfc64cfa3e84f97c)
