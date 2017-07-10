# JavaScript
## Introduction
言わずと知れたWEB系スクリプト型言語。

## Installation
不要。ブラウザベース。

## Settings
不要

## Usage

## Tips
### 現在のURLを取得する
```js
var currentUrl = window.location.href;
```
### ID指定して要素へページ内ジャンプする
```js
window.location.href = "#" + ID_OF_ELEMENT_OF_JUMP_DISTINATION;
```
### エレメントに対する編集
```js
// 挿入先のエレメントをID指定
var targetElement = document.getElementById("hoge");
// 挿入エレメントをｓｐａｎ要素で生成
var insertElement = document.createElement('span');
// 指定したいクラス名を設定
insertElement.className = "指定したいクラス名";
// タグ内文字列を設定
insertElement.innerHTML = "インナーHTML";
// 挿入先のエレメントを非表示に
targetElement.style.display = "none";
// 子要素を追加
targetElement.appenChild(insertElement);
// 適当な文字列を追加
targetElement.appenChild(document.createTextNode('foo'));
targetElement.appenChild(document.createTextNode('bar'));
// 最後の子要素を削除
targetElement.remobeChild(targetElement.lastChild);
```
↑の結果
```html
<!-- 実行前 -->
<div id="hoge"></div>

<!-- 実行後 -->
<div id="hoge" class="指定したいクラス名" style="display: none;">
	<span>インナーHTML</span>
	foo
</div>
```



### Utilities
### Errors

## References
