# OpenCVを使ってレシートを読み取る!
## 下準備
```bash
# condaで仮想環境を構築
$ conda create -n opencv python=3.5
$ source ~/.pyenv/versions/miniconda-3.4.0.5/bin/activate opencv
# conda でopencvをインストール
$ conda install -c https://conda.anaconda.org/menpo opencv3
```
確認
```bash
$ python
```
```python
>>> import cv2
>>> cv2.__version__
'3.1.0'
```
