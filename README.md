# 概要

アニメの口コミや評価ができるアプリケーションです！<br>
作品について深く考察して感想を投稿したり、他に人の解釈を読んで疑問を解決することで、作品を存分に楽しむことができるようになっています！<br>

## 制作背景
アニメの感想を人と共有したり、自分が知らないアニメをレビューや評価を通して知ることができ、観たい、興味のあるアニメを探すことが出来ればいいなと思い作成してみました！

## 工夫・苦労したところ
レビューを投稿する際のモーダルウインドウを用いたフォームの作成とインクリメンタルサーチにかなりの時間がかかりました。<br>
データベースになかなかアニメのIDが保存できませんでしたが、jsの記述内容を見直して無事保存が出来るようになりました。<br>
星評価はjqueryのライブラリであるratyを使用して実装を進めました。<br>

## アプリケーションの機能一覧
・ユーザー新規登録機能<br>
・ユーザーログイン・ログアウト機能<br>
・レビュー作成機能<br>
・星評価、ランキング機能<br>
・レビュー編集、削除機能<br>
・いいね機能<br>
・インクリメンタルサーチによる検索機能<br>

## 使用技術一覧
|種別|名称|
|------|----|
|開発言語|Ruby(ver 2.5.1), jquery|
|フレームワーク|Ruby on Rails(ver 5.2.4.1)|
|マークアップ|HTML,CSS(Sass)|
|データベース|MYSQL|
|本番環境| AWS, S3|

# DEMO
![demo](https://raw.github.com/wiki/itokeso/review/gif/image3.gif)

![demo](https://raw.github.com/wiki/itokeso/review/gif/image4.gif)

# 本番環境

URL http://54.150.247.169/ <br>

テスト用アカウント<br>
▶︎メールアドレス: test@test<br>
▶︎パスワード: 11111111<br>


# DB設計

##  usersテーブル  
|Column|Type|Options|
|------|----|-------|
|name |string|null: false|
|e-mail|string|null: false|
|password|string|null: false|
### Association
- has_many :posts<br>
- has_many :favorites<br>
- has_many :favorited_posts<br>

## animesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|-----|
|title|string|---|
|detail|text|null: false|
|category_id|integer|null: false, foreign_key: true|
### Association
-has_many :posts<br>
-belongs_to :category<br>

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
-has_many :animes<br>

## posts
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|review|text|null: false|
|rate|float|null: false|
|user_id|integer|null: false, foreign_key: true|
|anime_id|integer|null: false, foreign_key: true|

### Association
-has_many :favorites<br>
-has_many :favorited_users, through: :favorites<br>
-belongs_to :user<br>
-belongs_to :anime<br>

## favorites
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|post_id|integer|foreign_key: true|

### Association
-belongs_to :user<br>
-belongs_to :post<br>





