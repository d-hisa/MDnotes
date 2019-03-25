<<<<<<< HEAD
# PlantUML
## Introduction
Java製のテキストベース作図ソフトウェア。DSLを持つ
## Installation
### Prerequrements
- Java(JDK)
### Atomで利用する場合
```bash
# Windows
$ cinst graphviz pandoc
# Mac
$ brew install graphviz pandoc
# PlantUMLのみ
$ apm install plantuml-viewer language-plantuml
# Markdownで書く
$ apm install markdown-preview-enhanced
```
- Settings
	- PlantUML ViewerのSettingsの`Charset`に`UTF-8`を設定
=======
# Plant UML

UML図をよしなに書くDSC。

## Installation

### Prerequirements

- JDK(Java Development Kit)
- GraphViz
- PlantUML本体

### Atomのmarkdown-preview-enhancedを使う場合

PlantUMLの本体はMPEに含まれているため不要。

#### JDKのインストール

Java製のためJDKを入れる必要あり。

- Macの場合

  - `brew cask install java`

- Windwosの場合

  - TODO:

#### GraphVizのインストール

- Macの場合

  - `brew install graphviz`
  - たくさん依存Libを入れられるので時間がかかるのでちゅうい

## Usage

できること一覧 | diagram | Description| Code* | |:---------|:-------------------| | Item One | Item Two |

### Commons

using code block on Atom

```puml
[*] --> ContentsListView : first view
```

aaa

### aa

```puml
package ViewController {
  package Contents {
    class ContentsListViewController {

    }
    class DetailContetntViewController {

    }
    class EditContentVIewCOntroller {

    }
    class AddContentViewController {

    }
  }
  package Category {
    class CategoriesListViewController {

    }
    class DetailCategoryViewController {

    }
    class EditCategoryViewController {

    }
    class AddCategoryViewController {

    }
  }
  package Others{
    class TagListViewController {

    }
    class SettingListViewController {

    }
  }

}
```
>>>>>>> b0df65ad4e40787965820c5ec6f4d65d1f9e6efe
