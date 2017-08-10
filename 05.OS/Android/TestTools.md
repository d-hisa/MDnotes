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



## UiAutomator
