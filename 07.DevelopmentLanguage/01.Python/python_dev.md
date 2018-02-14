# Python環境セットアップ

## Structure

OS      | Components
:------ | :--------------------------
Windows | Anaconda(miniconda)
Mac     | Homebrew + pyenv + Anaconda
CentOS  | git + pyenv + Anaconda

## Mac編

### Prerequirements

- Homebrew

### pyenv

```bash
$ brew install pyenv
$ ls ~/.bash_profile || touch ~/.bash_profile
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
$ echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
$ exec $SHELL -l
# confirm installed currently
$ pyenv -v
pyenv *.*.*
```

### Anaconda

- 大抵の場合必要になってから入れるのでminicondaでおk

```bash
# confirm latest miniconda version.
$ pyenv install -l | grep miniconda
## pyenv install -l | grep anaconda
# install latest version
$ pyenv install miniconda*-*.*.*
$ pyenv rehash
$ pyenv global miniconda*-*.*.*
$ echo 'export PATH="$PYENV_ROOT/versions/anaconda*-*.*.*/bin/:$PATH"' >> ~/.bashrc
$ conda update conda
```

## pyenv

### Installation

### How to use pyenv

## Anaconda

### Installation

### How to use conda

#### Usage Commands

-

#### Create Virtual Environment

## Utility Packages
