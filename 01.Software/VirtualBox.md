# Virtual Box


## Tips
### Mac上のWindowsVMに共有フォルダを作る
#### Prerequirements
- VirtualBoxをインストール済み
- WindowsVMを構築済（インターネット疎通あり）

#### 手順
- `$ mkdir /your/sharing/dir/path/ShareDir`
- VirtualBox起動
- WindowsVMを選択し、`設定`を選択
	- 共有フォルダタブを開く
	- `+`を開き、`ShareDir`を指定する
	- 全てのポップアップをOKで閉じる
- WindowsVMを起動
- Windowsが完全に起動した後、VirtualBoxのMac側のファイルメニューの`Device`->`INsert Guest Additions CD images...`を選ぶ
- WindowsがCDを仮想ドライブで認識したら、`VBoxWindowsAdditions.exe`を実行
- ダイアログを順次進める
- 再起動する
- 共有フォルダを認識できていればOK
