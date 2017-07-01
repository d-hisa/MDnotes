# Ubuntu
## Introduction
Debian fork distribution.  


## Instalation
### USB install
- Prerequirements
	* USB: Over 2GB starge
	* iso file: ubuntu image file for installed machine architecture

#### Work on Mac
**Notice**: Disconnected USB device before this work.
##### Create Install USB

1. Open `Terminal` (ex. terminal, iTerm).
1. Convert to ubuntu image (iso -> img).
	- `hdiutil convert -format UDRW -o /path/to/outputFileName.img /path/to/inputFileName.iso`
1. Recognize disk list following disks.
	- `diskutil list`
	- presented moounted disk list, e.g. disk0, disk1, and others(after write diskN).
	- for example
	```bash
	/dev/disk0 (internal, physical)
	...
	/dev/disk1 (internal, physical)
	...
	```
1. Connect USB device, and recognize disk"N" number of connected USB device using command `diskutil list`.
	- for example
	```bash
	/dev/disk0 (internal, physical)
	...
	/dev/disk1 (internal, physical)
	...
	/dev/disk2 (external, physical) <- New!!
	...
	```
1. Unmount USB device.
	- `diskutil unmountDisk /dev/diskN`
1. Burn img file to USB device.
	- `sudo dd if=/path/to/imgfile.img of=/dev/diskN bs=1m`
	- this process spend very long time.
1. After finished above command, maybe present following alert.
	- `This device unreadable this computer.`
	- choose `unmount`.
1. Disconnect USB device, and finish.

##### Install
1. Connect install-usb to installing machine.
1. Boot machine
	 - maybe should be setting BIOS: can boot from usb if you need. 
1. Install according to presents.

## Settings
### apt-get init
```bash
sudo apt-get update
sudo apt-get upgrade
```
### Install Packages by apt-get
- vim
- git
- build-essential

### Theme Change
以下のテーマを使ってみる。
- Flat-Plat
- Papirus
#### CLI作業
```bash
## Prerequrements
# テーマ設定ツールを入れる
sudo install unity-tweak-tool
## FLat-Plat
cd /tmp
curl -sL https://github.com/nana-4/Flat-Plat/archive/v20170323.tar.gz | tar xz
cd Flat-Plat-20170323
sudo ./install.sh
## Papirus
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme
## CLIからテーマ設定ツールを起動（UnityからGUIで起動でもOK）
unity-tweak-tool
```
#### GUI作業
- UnityTweakTool
    + `外観`の`テーマ`/`アイコン`をFLat-platとPapirusに変更
- Ubuntuの「設定」
    + `外観`の`背景`を青っぽい色へ変更

### ワークスペース
- `設定`の`外観`の`ワークスペースを有効にするにチェック
- <kbd>Ctrl + Alt + カーソルキー</kbd>でワークスペースを移動
- <kbd>Ctrl + Alt + Shift + カーソルキー</kbd>でアクティブウィンドウを他のワークスペースへ移動

### `

## Usage


