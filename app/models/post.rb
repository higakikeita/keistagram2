class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  accepts_nested_attributes_for :photos
  def liked_by(current_user)
    # user_idが一致するlikeを検索する
    Like.find_by(user_id: current_user.id)
  end
end
