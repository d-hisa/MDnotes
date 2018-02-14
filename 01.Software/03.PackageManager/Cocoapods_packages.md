# Cocoapods Packages
## Commons
### Installation
```bash
$ cd /path/to/your/xcode/project
$ pod init  # if you need
$ vim Podfile
[Podfile]
pod 'hoge'
[EOF]
$ pod install
```

## PageMenu
### Description
スワイプによるタブ切り替えを実装するパッケージ
### Usage
- CAPSPageMenuのプロパティを設定
  - 使いたいViewControllerで下記を宣言。
  ```swift
  var pageMenu : CAPSPageMenu?
  ```
- 表示したいViewControllerを追加
  - 表示したいViewControllerの配列をつくる。
  ```swift
  var controllerArray : [UIViewController] = []
  var controller1 = UIViewController() // 自分で表示したいViewControllerを書く。
  var controller2 = UIViewController() // 自分で表示したいViewControllerを書く。
  var controller3 = UIViewController() // 自分で表示したいViewControllerを書く。

  controllerArray.append(controller1)
  controllerArray.append(controller2)
  controllerArray.append(controller3)
  ```
- PageMenuの設定
  - PageMenuの設定を行う
  ```swift
  var parameters: [String: AnyObject] = ["scrollMenuBackgroundColor": UIColor.blackColor(),
            "viewBackgroundColor": UIColor.blackColor(),
            "selectionIndicatorColor": UIColor.orangeColor(),
            "bottomMenuHairlineColor": UIColor.blackColor(),
            "menuItemFont": UIFont(name: "HelveticaNeue", size: 13.0)!,
            "menuHeight": 80.0,
            "menuItemWidth": 120.0,
            "centerMenuItems": true,
            "menuItemSeparatorWidth": 4.3   ]

  pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 50.0, self.view.frame.width, self.view.frame.height), options: parameters)
  ```
- Viewに追加
```swift
self.view.addSubview(pageMenu!.view)
```
