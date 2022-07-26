# Memonto
![demo](https://user-images.githubusercontent.com/104292397/180166394-a4b69b2d-3042-451e-88c0-1748739836a7.gif)

<img src="https://img.shields.io/badge/Ruby-v2.6.3-cc0000"> <img src="https://img.shields.io/badge/Rails-v6.1.6-cc0000">

<br>

## 概要
その瞬間に感動したこと、SNSに投稿するほどでもない小さなことなどの情報を<br>
自分だけのライフログとして簡単に記録することができるサービスです。  
記録した出来事を振り返ることで、自分と向き合う時間を作ることができます。

### :notebook_with_decorative_cover:テーマを選んだ理由
日々の小さな出来事や心を動かされた時の感情などは、時間が過ぎるにつれ忘れることが多いです。  
そこで自身の活動や思考を見返す目的で日記帳を買って始めましたが、<br>
「書くスペースが広すぎる」「書く内容が浮かばない」「書く時間がない」「飽きた」<br>
そんな理由から長続きしませんでした。<br>
記録のために日記を始めたものの、このような経験をした人は多いと思います。<br>
そのような人たちが「簡単に長続きできる」「記録を振り返ることで自分と向き合う時間を作る」ことが<br>
できたらという思いからこのサービスを制作しました。

### :notebook_with_decorative_cover:名前の由来
覚えておくための「memo」と記憶の「memento」を組み合わせて「Memonto」と名付けました。

### :notebook_with_decorative_cover:ターゲットユーザ
- 日々の記録や活動の記録をつけたい人
- ライフログに興味がある/やりたい人
- 日記を続けることに挫折した人

### :notebook_with_decorative_cover:主な利用シーン
- 小さな出来事や挑戦していることを記録したいとき
- 心を動かされた瞬間の思考や心情を記録したいとき
- 記録した出来事を振り返りたいとき
<br>

## 使用技術

### :notebook_with_decorative_cover:開発環境
- OS：Linux(CentOS)
- 言語：HTML, CSS, JavaScript, Ruby, SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

### :notebook_with_decorative_cover:Gem
- devise
- enum_help
- image_processing
- kaminari
- annotate
- pry-rails
- better_errors
- binding_of_caller
- Rubocop
<br>

## 機能一覧

### :notebook_with_decorative_cover:一般ユーザ
- ユーザ登録・ログイン機能
- ゲストログイン機能
- アカウント編集・退会機能
- 記録管理機能(CRUD)
- タグ機能
- お気に入り機能(非同期通信)
- 分析機能(投稿数グラフ・感情数グラフ)
- 検索機能(キーワード・タグ・お気に入り)
- ページネーション機能

### :notebook_with_decorative_cover:管理ユーザ
- ログイン機能
- ユーザ管理機能
- 検索機能(キーワード)

### :notebook_with_decorative_cover:こだわり
既存の日記アプリを使用した時に色々な機能があると便利な一方、面倒だと感じて使わなくなる経験がありました。<br>
そこで面倒な手順や機能を除いて簡単に記録・振り返りができるように以下の点を工夫しました。
|記録投稿ページ|記録一覧ページ|
|---|---|
|<p align="center"><img src="https://user-images.githubusercontent.com/104292397/180166056-a4dd951b-14c6-40c5-9d62-06bc5706b8d0.png" width="300px"></p>|<p align="center"><img src="https://user-images.githubusercontent.com/104292397/180166114-74da7abc-41b4-4fcc-a1d5-fc68be96e3b0.png" width="300px"></p>|
|記録する感情は5つのアイコンから選択できるように<br>設計しました。|タグをつけることで記録一覧から検索できます。|

|マイページ|
|---|
|<p align="center"><img src="https://user-images.githubusercontent.com/104292397/180165007-432edb4e-b4d3-4321-9fd2-700994112d15.png" width="300px"></P>|
|マイページでは一ヶ月間の投稿数と感情数のグラフが<br>表示されます。|
<br>

## 設計書

### :notebook_with_decorative_cover:インフラ構成図
<img src="https://user-images.githubusercontent.com/104292397/180225820-cc47068f-045e-4233-b62a-40ca96bd00d8.png" width="700px">

### :notebook_with_decorative_cover:ER図
<img src="https://user-images.githubusercontent.com/104292397/180165984-3d3e2bad-d24d-47ca-a367-72b16173047c.png" width="700px">

### :notebook_with_decorative_cover:その他
UI Flows、テーブル設計書、アプリケーション詳細設計は
[こちら](https://docs.google.com/spreadsheets/d/1QEAMEUGihp_K9UVH0GdrhWeV2JNjYlxIoFk4WKOcPBQ/edit?usp=sharing)
から閲覧できます。
