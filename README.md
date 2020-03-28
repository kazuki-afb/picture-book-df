
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
