# Xcode
## Introduction
## Installation
installing
## Setup
## Customize
### Plugins
プラグインマネージャである`Alcatraz`を入れて、そこでマネージする。
#### update_xcode_plugins
Xcode8でプラグインを使うためのツール。各プラグインにUUIDを付与していくれるらしい。
```bash
$ gem install update_xcode_plugins
$ update_xcode_plugins
```
#### Alcatraz
Xcode用のプラグインマネージャ。Xcode8ではデフォルトで動かないので、ごにょごにょする必要がある。
##### Installation
[公式ページ](http://alcatraz.io/)から`curl`をコピペして実行
```bash
$ curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh
```
このあと、update_xcode_pluginsを実行する。unsignしないと動かないらしい。
```bash
update_xcode_plugins --unsign
```
このあと署名なしにする感じのことを聞かれるので、yesと言っていくしかない
##### Uninstallation
```bash
$ rm -rf ~/Library/Application\ Support/Alcatraz
```
##### Prerequirements
`Window`タブに`PackageManager`が出現し、プラグインを探して入れられるようになる。




## Usage
## Tips
