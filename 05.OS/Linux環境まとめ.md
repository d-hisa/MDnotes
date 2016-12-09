# Linux設定関係まとめ
## Convenient Settings
### Alias
コマンドをショートカットできるAlias。
`~/.bashrc`か`~/.bash_profile`に書き込む。  
それぞれログイン時に読み込まれるが、bash_profileはそのユーザにログインしたとき、bashrcはそのコンソールが起動されたときに読み込まれるものらしい。  
基本的にはbash_profileに環境変数を、bashrcにaliasを書くのが推奨されているとか。  
sshに限って言えば、`.ssh/config`内に書くほうがエレガント。  
記法は以下のとおり。
```bash
$ vim ~/.bashrc

[.bashrc]
alias COMMAND_NAME="COMMAND_ALIAS"
```
+ COMMAND_NAME：そのコマンドにつけたいalias名
+ COMMAND_ALIAS：そのコマンドの実態
