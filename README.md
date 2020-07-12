# 概要

アニメの口コミや評価ができるアプリケーションです！<br>
作品について深く考察して感想を投稿したり、他に人の解釈を読んで疑問を解決することで、<br>
作品を存分に楽しむことができるようになっています！<br>

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

# DB設計

##  usersテーブル  
|Column|Type|Options|
|------|----|-------|
|name |string|null: false|
|e-mail|string|null: false|
|password|string|null: false|
### Association
- has_many :posts
- has_many :favorites
- has_many :favorited_posts

## animesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|-----|
|title|string|---|
|detail|text|null: false|
|category_id|integer|null: false, foreign_key: true|
### Association
-has_many :posts
-belongs_to :category

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
-has_many :animes

## posts
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|review|text|null: false|
|rate|float|null: false|
|user_id|integer|null: false, foreign_key: true|
|anime_id|integer|null: false, foreign_key: true|

### Association
-has_many :favorites
-has_many :favorited_users, through: :favorites
-belongs_to :user
-belongs_to :anime

## categories
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|post_id|integer|foreign_key: true|

### Association
-belongs_to :user
-belongs_to :post





