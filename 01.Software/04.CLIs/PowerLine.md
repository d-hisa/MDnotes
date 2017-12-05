# Powerline
## Introduction
コンソールの見た目をリッチにするテーマ的なものらしい。

## Prerequirements
- brew

## Setup(Mac)
### Font install
powerlineをうまく表示させるにはパッチがあたっているフォントが必要らしい。
```bash
# Add a new repository
$ brew tap sanemat/font
# confirm added repository
$ brew tap
~
sanemat/font
~
# install with option (with many dependenting packages)
$ brew install --vim-powerline --powerline ricty
## if you can be installed currently, 
## execute following commands
## (maybe show you in std I/O @ your shell).
***************************************************
To install Ricty:
  $ cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
  $ fc-cache -vf
***************************************************
# restart shell
exec $SHELL -l
```
#### iTermの場合
- <kbd>Cmd</kbd>+<kbd>,</kbd> : Open Preference
    - `Profile`
        - `Default` - `Text`
            - `Font` - `Change font`
                - Select `Ricty for Powerline`

### Powerline-shellのインストール
#### pip でインストールする場合
> **前提** Anacondaのインストール等が終わり、pipがインストールされていること。
```bash
$ pip install powerline-shell
$ vim ~/.bash_profile
[~/.bash_profile] # adding following passage
function _update_ps1() {
    PS1="$(powerline-shell $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
[EOF]
$ source ~/.bash_profile
```
#### Gitからクローンする場合（未実施）
```bash
# make dir for powerline
$ mkdir ~/.powerline && cd -
# clone repository
$ git clone https://github.com/milkbikis/powerline-shell
$ cd powerline-shell
# execute install script
$ ./install.py
# confirm created script
$ ls powerline-shell.py
```
### Powerlineのカスタマイズ
まずはカスタム用ファイルを作成
```bash
$ powerline-shell --generate-config > ~/.powerline-shell.json
```