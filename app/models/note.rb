class Note < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :eyecatchimage, ImageUploader

  belongs_to :user
  has_many :paid_members
  has_many :likes, dependent: :destroy

  validates :title, presence: true

  enum category: [:manga, :column, :novel, :music]

  def like_user(user_id)
      likes.find_by(user_id: user_id)
  end
end
