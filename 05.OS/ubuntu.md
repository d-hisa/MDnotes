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
- tree
- build-essential

### Theme Change
�ȉ��̃e�[�}���g���Ă݂��B
- Flat-Plat
- Papirus
#### CLI����
```bash
## Prerequrements
# �e�[�}�ݒ��c�[����������
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
## CLI�����e�[�}�ݒ��c�[�����N���iUnity����GUI�ŋN���ł�OK�j
unity-tweak-tool
```
#### GUI����
- UnityTweakTool
    + `�O��`��`�e�[�}`/`�A�C�R��`��FLat-plat��Papirus�ɕύX
- Ubuntu�́u�ݒ��v
    + `�O��`��`�w�i`�����ۂ��F�֕ύX

### ���[�N�X�y�[�X
- `�ݒ�`��`�O��`��`���[�N�X�y�[�X���L���ɂ����Ƀ`�F�b�N
- <kbd>Ctrl + Alt + �J�[�\���L�[</kbd>�Ń��[�N�X�y�[�X���ړ�
- <kbd>Ctrl + Alt + Shift + �J�[�\���L�[</kbd>�ŃA�N�e�B�u�E�B���h�E�𑼂̃��[�N�X�y�[�X�ֈړ�

### Apple Wireless keyboard を使う
#### Bluetoothドングル
挿せば認識されたので、特別なことはしてない。
```bash
# これを叩いてそれっぽいデバイス名があればOK
$ lsusb
```
あとはGUIでBluetooth設定をするだけ。
#### Macっぽいキーレイアウトにする
そのままだと色々違うので、できるだけMacっぽくなるように設定する。
- `英数/かな`キーで日本語入力切替をする
	1. iBusからFcitxに切り替える
	2. 次の，前のソースへ切り替えを両方空にする．
	3. 入力ソースに日本語，Mozc(Fcitx)を追加し，日本語を一番上にする．
	4. `sudo dpkg-reconfigure keyboard-configuration`で下記順に設定
		- Apple アルミニウムキーボード (JIS)
		- 日本語
		- 日本語
		- キーボード配置のデフォルト
		- コンポーズキーなし
	5. Fcitxの設定で全体の設定を開き，拡張オプションを表示にチェックマークをつけ，入力メソッドをオンにの項目にHiraganakatakanaを，入力メソッドをオンにの項目にMuhenkanを割り当てる．
	6. Mozcの設定でキー設定を編集し，エントリー追加から，入力文字なし，Hiragana,ひらがなに入力切替，を追加する.
	7. さらに入力キー順にソートし，Hiraganaが設定されている部分のコマンドをひらがなに入力切替に設定する．
- ファンクションをFNキーなしでも使えるように
	+ `echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf`
	+ 再起動でOK

## Usage

## Additional Tools
### Atom
#### Install
```bash
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom
```
