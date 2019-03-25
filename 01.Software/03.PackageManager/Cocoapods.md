# Cocoapods

## Instruction

iOS開発用の様々なパッケージをよしなにするパッケージ管理ツール

## Installation

iOS開発＝Mac専用。

```bash
$ sudo gem install cocoapods
# もし怒られたら...
$ sudo gem install -n /usr/local/bin cocoapods
$ pod setup # 初期セットアップ
```

## Usage

```bash
$ cd /path/to/Xcode/Project
$ pod init
$ ls
...
Podfile # confirm created "Podfile"
...
$ vim Podfile
[Podfile]
...
 # For your_prject_name
 pod 'your_needed_package_name'
 ## repeat this code for packages as you need.
end
[EOF]
$ pod install # should spend so long time first install
$ ls  # confirm added following files and directories
...
Podfile
Podfile.lock
Pods/
your_project_name.xcworkspace
...
$ open your_project_name.xcworkspace
# if you launched by diffenrent application.
$ open -a Xcode your_project_name.xcworkspace
```

## Commands
