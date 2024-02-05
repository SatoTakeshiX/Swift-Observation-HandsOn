# 「Swift 5.9からのデータ監視 Observationフレームワーク入門」サンプルコード

本リポジトリは書籍「Swift 5.9からのデータ監視 Observationフレームワーク入門」のサンプルコードを提供するリポジトリです。
`Observation`フレームワークは`Swift 5.9`から導入された新しいフレームワークです。
`Observation`フレームワークが登場した経緯、使い方、特に`SwiftUI`との連携方法や従来のデータバインディングで用いられた`ObservableObject`プロトコルとの比較を解説します。

# Book URL

## 同人誌
* [Booth](https://personal-factory.booth.pm/items/5425394)
* [技術書典](https://techbookfest.org/product/vFjd8cyB0ic0v2a7EECm7u?productVariantID=ksMDDE6xtziytRnpYahstU)

# 目次

## 第一章：Observationフレームワーク概要

`Observation`フレームワークが登場した背景や仕組みを解説します。
`Swift`マクロがコードをどのように変換しているかを深掘りします。

[サンプルコード](https://github.com/SatoTakeshiX/Swift-Observation-HandsOn/tree/main/Chapter1)


## 第二章：計算プロパティを初期化する新しい方法

`Observable`マクロの登場で、格納プロパティが初期化メソッド内で初期化できなくなりました。
`SE-0400`のプロポーザルはそれを解消します。
`Observation`フレームワークの関連プロポーザルとして`SE-0400`がどのような変更なのかをみていきます。

[サンプルコード](https://github.com/SatoTakeshiX/Swift-Observation-HandsOn/tree/main/Chapter2)

## 第三章：ObservableObjectとの比較

`Observation`フレームワークの特徴や従来の`ObservableObject`プロトコルと何が異なるのかを探ります。
`Observation`フレームワークのメリットがよく分かる章です。


[サンプルコード](https://github.com/SatoTakeshiX/Swift-Observation-HandsOn/tree/main/Chapter3)


## 第四章：SwiftUIとのデータバインディング

`SwiftUI`との連携を中心に解説します。
`@State`や`@Environment`、`@Bindable`といったデータを扱う`Property Wrapper`の利用方法を解説します。


[サンプルコード](https://github.com/SatoTakeshiX/Swift-Observation-HandsOn/tree/main/Chapter4)


# ライセンス

本サンプルコードはMITで配布しています。
詳細は[こちら](https://github.com/SatoTakeshiX/Swift-Observation-HandsOn/blob/main/LICENSE)をご覧ください。 

# Pull Requestやissueについて

サンプルコード自体の疑問や改善点があれば、ぜひPull Requestやissueの作成をお願いします。
ただし、書籍上、解説のためにわざとワーニングを出している箇所があるので予めご了承ください。

書籍本文自体の疑問があれば下記メールアドレスにまでご連絡ください。

* t.sato@personal-factory.com

# 修正履歴
原稿の修正履歴をこちらのページのリリースページで公開します。
詳しくはこちらのページをご覧ください。

https://github.com/SatoTakeshiX/Swift-Observation-HandsOn/releases
