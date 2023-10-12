class Play < ApplicationRecord
  belongs_to :star
  belongs_to :user
  validates_uniqueness_of :star_id, scope: :user_id
end
