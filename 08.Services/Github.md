# Github
## ssh認証方式へ
### ssh鍵の作成
```bash
$ ssh-keygen -t rsa -C hoge@hoge.com
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/hisazawa/.ssh/id_rsa): FILE_NAME	# 任意のファイル名
Enter passphrase (empty for no passphrase): [return]	#パスフレーズが必要ない場合はそのままEnter
Enter same passphrase again: [return again]	# もいっかい
```
これを`cat FILE_NAME.pub`したものをGithubのSettingsで貼り付ける。  
Mac/Linuxの場合は適宜秘密鍵のPermissionを600にしておくこと。  
登録が成されたかを確かめるには以下のコマンドを叩く。
```bash
$ ssh -T git@github.com -i "PRIVATE_KEY_PATH"
Hi USER_NAME! You\'ve successfully authenticated, but GitHub does not provide shell access.
# 上記メッセージが出れば成功
```

### リポジトリの設定を書き換え
リポジトリのプロトコルを`https`プロトコルをから`git`（ssh）に変える。  
`.git/config`を書き換えることでもできるが、今回はコマンドで。
```bash
$ git remote set-url origin NEW_REPOS_URL
```
で書き換え。

## リポジトリへの招待方法
- ブラウザでログインした状態でリポジトリの画面を開く
- 右上の＋マークの中から「New Collaborator」をクリック
- 招待したいユーザー名（メアドではだめっぽい）を入力すると「Add」ボタンが有効になるのでクリック
