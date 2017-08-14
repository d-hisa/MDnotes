# CLI commands
## Introduction
CLIで導入するとベンリーなコマンドをまとめる
## commands
### exa
- `ls`をリッチにしたコマンド
- gitにも対応している

#### Installation
- Mac
    - `brew install exa`
- Linux
    - Way1:Download Binary file
        - Download from [Releases · ogham/exa](https://github.com/ogham/exa/releases)
        - Move downloaded files include path directory
        - chmod +x
        - ex.)
        ```bash
        $ cd
        $ wget https://github.com/ogham/exa/releases/download/v0.7.0/exa-linux-x86_64-0.7.0.zip
        $ unzip exa-linux-x86_64-0.7.0.zip
        $ sudo mv exa-linux-x86_64 /usr/local/bin
        #$ sudo yum install libgit2 http-parser-devel
        $ sudo ln -s libhttp_parser.so.2 /lib64/libhttp_parser.so.2.1
        $
        ```
#### Usage
```bash
$ exa [options] [dir/path]
```
- options
    - `-l`:list
    - `--git`:git status showing(need `-l` option)

#### Tips
```bash
alais ls="exa"
```
しておくと便利

### lnav
#### Installation
**CentOS7**
```bash
$ yum install epel-release
$ yum install lnav
```
