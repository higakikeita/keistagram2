# README
## Instagram風SNSアプリケーション
<p align="center">
<a href="https://guides.rubyonrails.org/" rel="nofollow"><img src="https://camo.githubusercontent.com/e6318bb26cecc5eaec3548fe7446e2ccc0820afe/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e61702d6e6f727468656173742d312e616d617a6f6e6177732e636f6d2f302f3534333133332f37613663323763642d303963622d623965372d376231622d3163623536646662656530632e706e67" height="60px;" data-canonical-src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/543133/7a6c27cd-09cb-b9e7-7b1b-1cb56dfbee0c.png" style="max-width:100%;"></a>
</p>

<p align="center">

<img src="https://user-images.githubusercontent.com/57832553/73933784-96712500-4920-11ea-974f-23b73e2c6113.png" height="60px;" style="max-width:100%;">
<img src="https://user-images.githubusercontent.com/57832553/73936026-3cbf2980-4925-11ea-97b2-274bd60a8fb5.png" height="60px;" style="max-width:100%;">

# サイトURL
https://keistagram2.herokuapp.com

## このサイトについて
画像投稿ができるInstagram風SNSサイトです。
ユーザー登録が必要です。
ユーザーはお気に入りの画像を投稿できます。
投稿は一覧画面で見ることができます



* Ruby version
2.5.1
* Ruby on rails 
5.2.4

# DB設計

# users table
|Column|Type|Options|
|------|----|-------|
### Association
has_many :posts, dependent: :destroy<br>
has_many :likes<br>
has_many :comments
# comments table
|Column|Type|Options|
|------|----|-------|
|comment|text|
|post   |references|foreign_key: true null: false|
|user   |references|foreign_key: true null: false|
### Association
belongs_to :user<br>
belongs_to :post

# posts table
|Column|Type|Options|
|------|----|-------|
|caption|string|
|user   |references|foreign_key: true null: false|
### Association
belongs_to :user<br>
has_many :photos, dependent: :destroy<br>
has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy<br>
has_many :comments, dependent: :destroy

# likes table
|Column|Type|Options|
|------|----|-------|
|post  |references  |foreign_key: true null: false|
|user  |references  |foreign_key: true null: false|
### Association
belongs_to :user<br>
belongs_to :post<br>
validates :user_id, uniqueness: { scope: :post_id }
# photos table
|Column|Type|Options|
|------|----|-------|
|image |string|null: false|
|post  |references|foreign_key: true null: false|

### Association
belongs_to :post<br>
validates :image, presence: true

