# アプリケーション名
  悪魔の実図鑑

# URL
  https://picture-book-df.herokuapp.com/

# テストアカウント
  ユーザー名： test
  メールアドレス： t@t
  パスワード： mmmmmmmm

# 作成背景
  検索が苦手な人でも使いやすい検索アプリを作りたいと思ったから。
  理由：私自身がプログラミングを始める前まではGoogle検索が苦手でもっと感覚的に検索できるアプリを作りたかった。
  どうしてGoogle検索が苦手だったのか：①検索ワードが出てこない
                                 ②検索しても思った通りの検索結果が出てこない。（絞り込みができていない）
  私自身がワンピースが好きなので、ワンピース内に出てくる悪魔の実図鑑を作成してみたかった。

# イメージ
![image](https://user-images.githubusercontent.com/61180330/79121363-1b206980-7dd0-11ea-9754-e42f14eb1b55.png)


# picture-book-df DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :comments

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|username|string|null: false|
### Association
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|ability|text||
|skill|text||
|consumer|string||
|user_id|integer|foreign_key: true|
|item_id|integer|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :user
