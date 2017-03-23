# Markdwon

## Tips
### 改頁したいとき
```html
<div style="page-break-after:always"></div>
```
を挿入するとその前後で改頁される（htmlを印刷したときなど）

### ページ内リンクを貼る
```markdown

[リンク元文字列](#LinkAnchorName)

some texts...

## リンク先の文字列 <a name="LinkAnchorName"></a>
```
のようにすると、リンク元文字列からリンク先の文字列にジャンプできる
