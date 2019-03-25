# ImageMagick
## Installation
### Windows
- Prerequirement:Chocolately
```bash
cinst imagemagick
```

### Mac
- Prerequirement:Home brew
```bash
$ brew install ImageMagick
```

## Usage
### Merge Image
```bash
$ convert [+append / -append] INPUT_IMAGE1 INPUT_IMAGE2 [INPUT_IMAGE3 ...] OUTPUT_IMAGE
```
- `+append`:Vertical merge
- `-append`:Horizontal Merge

### .ai to .svg to .emf to powerpoint imports
ベクターファイルをパワポに落とし込む手順
#### Prerequirements
- ghostscript
    - `brew install ghostscript`
- inkscape
    - `brew cask install inkscape`

#### ai to svg
```bash
# imagemagickが内部的にghostscriptを使っているらしく、エラーを吐くので必要
$ brew install ghostscript
$ convert input.ai output.svg
```

#### svg to emf
```bash


```

### create gif animation 
#### Prerequirements
- secuaential increment numbered image files
    - ex.) `image01.png`, `image02.png`

#### how2
```bash
$ convert -layers optimize -loop 0 -delay 40 image*.jpg output.gif
```
- `-layers optimize`: resize and optimize image (maybe large file size if without option)
- `-loop ?`:a number of loops(0: infty)
- `-delay ??`:mili-sec between images
- `image*.jpg`:input images
- `output.gif`:output gif image


