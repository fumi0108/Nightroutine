class Star < ApplicationRecord
    belongs_to :user
    has_many :plays, dependent: :destroy
  has_many :played_users, through: :plays, source: :user
    mount_uploader :image, ImageUploader


    has_many :comments, dependent: :destroy
end

