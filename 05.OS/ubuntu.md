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
## Usage

