# Windowsコマンドメモ
## robocopy
### Summary
- linuxで言うところのrsync的な挙動をしてくれる標準バンドルツールらしい。

### How2use
```bash
robocopy SOURCE_PATH TARGET_PATH [FILE] [OPTION]
```
#### option
- `/S`:空を除いたサブディレクトリコピー
- `/E`:空を含むサブディレクトリコピー
- `/LEV:n`:コピー元ディレクトリのツーリ上位nレベルのみコピー
- `/MAX:n`:最大バイト数指定
- `/MIN:n`:最低バイト数指定
- `/XD dir_path`:指定ディレクトリを除外
- `\XF file_path`:指定したファイル（ワイルドカード）を除外

#### Example
- `robocopy "\\Fsr003\1.組織(社員.派遣社員）\5.ビジネスプラットフォーム事業部\00.共通\004.イベント\20161202_忘年会" "C:\Users\hisazawa\Box Sync\070.BPF忘年会" /E /MAX:3000000 /XD "\\Fsr003\1.組織(社員.派遣社員）\5.ビジネスプラットフォーム事業部\00.共通\004.イベント\20161202_忘年会\参考（過去）"`

- `robocopy "\\Fsr003\1.組織(社員.派遣社員）\5.ビジネスプラットフォーム事業部\00.共通\004.イベント\20161202_忘年会\参考（過去）" "C:\Users\hisazawa\Box Sync\070.BPF忘年会\参考（過去）" /E /MAX:3000000 /XF *.jpg *.png *.mp4 *.wav`

## find
### Summary
- linuxのfind文とは似ているがベツモノ。Cmderで使うとこっちが優先されるので、毎回使い方を忘れる
## How2use