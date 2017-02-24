# WinでChocolateyを使ってみるTips
## Introduction
Win版のyum、homebrew、apt-get的なものらしい。Pwoershellでインストールするみたい。  
今回は、Alfredライクなランチャを入れるついでに触ってみる。
## Installation
### Powershellの準備
Powershellのスクリプトによって実行されるので、スクリプトの実行を許可しよう。
```powershell
[cmd]
C:\WINDOWS\system32>powershell
[Powershell]
PS C:\WINDOWS\system32> Get-ExecutionPolicy
Restricted
> Set-ExetutionPolicy RemoteSigned
> Get-ExecutionPolicy
RemoteSigned
```
スクリプトの実行ポリシーが`RemoteSigned`であればOK。
### Chocolateyのインストールスクリプトの実行
[Chocolateyの公式ページ](https://chocolatey.org/install)へ行き、Powershellでコマンドをコピペ実行。
```Powershell
[Powershell]
> iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
```  
この時、Admin実行しておかないとERRORを吐くので注意。何もなければPATHまで通してくれる。これだけ。
## Usage
- `chocolatey install HOGE_PACKAGE`
- `choco install HOGE_PACKAGE`
- `cinst HOGE_PACKAGE`

はすべて同義だとか。あとは`choco list`でインストール可能なパッケージを一覧したり、~~`choco update all`でパッケージの一括アプデ、~~`choco install / uninstall`でパッケージの追加/削除が可能。
> NOTICE
`choco update`はDeprecatedらしい。`choco upgrade`推奨とのこと。

## Commands
| Commands | Description|
| :------------- | :------------- |
|choco list [packageName]|パッケージ検索。引数がなければすべてのパッケージを表示。|
|choco list -lo [packageName]|インストール済みのパッケージ検索。引数がなければすべてのインストール済みパッケージを表示。|
|cinst [packageName]|指定パッケージのインストール。|
|cuninst [packageName]|指定パッケージのアンインストール。|
|cup|Chocolatey本体のアップデート。|
|cup [packageName]|指定パッケージのアップデート。|
|cup all|インストール済みのパッケージを全てアップデート。|


## Tips
Chocolateyは管理者権限がないと弾かれるので、ターミナル（今回はCmder）に常に管理者権限を付与する。
- \*.exe本体を右クリック
- 互換性
- 管理者として実行にチェックを入れる

## Recommend package
### Hain
Alfredライクなランチャ。開発死んでるExecutorと違って絶賛Pre中のようす。  
見た目もモダンな感じで良い。  
個人的にExecutorでできなかった`SnippingTools`のランチや日本語の文字化けがないのがよろしい。
#### Instration
```shell
$ cinst hain
```
でおｋ。この時、cmdをAdminで起動しておかないとPermitionに弾かれるので注意。  
cmd上での処理が終わったあとも、しばらく画面中央にHマークのインストーラがうろちょろするので、しばらく我慢すること。
#### Usage
`alt + space`でランチャ起動してあとはポチポチするだけ。  
文頭を`/`で始めると、hain特有のコマンドを実行できるっぽい。何があるかはそのうち調べよう。
