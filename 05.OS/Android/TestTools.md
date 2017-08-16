# Test tools
## Introduction
Androidでテストを行うためのツールについてまとめる。
## Tools Overview
| Tools | Description     |
| :------------- | :------------- |
| JUnit|ユニットテスト用|
|Espresso|アプリ単独の動作確認用|
|UiAutomator|他のアプリとの連携テスト用|

## Commons

## JUnit

## Espresso
- Installing latest Android support repository
	- 47.0.0 in 2017/08/10
- add following contents @app's `build.gradle`
```groovy
dependencies{
	androidTestCompile 'com.android.support.test.espresso:espresso-core:2.2.2'
	androidTestCompile 'com.android.support.test:runner:0.5'
}
```


sankou
- [EspressoでAndroidのUIテストコード - Qiita](http://qiita.com/takusemba/items/efb256775de301e5c7be)
- [Android ユニットテストとUIテストの自動化プラクティス - Qiita](http://qiita.com/m1takahashi/items/abfd86f37e25dc6122a8)
- [Androidテストハンズオン - Qiita](http://qiita.com/cattaka/items/83f7a82ce80f352ef7c9)
- [Android用のUIテスト自動化フレームワーク<Espresso>の使い方について - Qiita](http://qiita.com/fujin/items/df97a97ef80491f16122)



## UiAutomator
