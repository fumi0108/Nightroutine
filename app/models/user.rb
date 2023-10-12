class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniau
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          
  has_many :stars, dependent: :destroy 
  has_many :plays, dependent: :destroy
  has_many :played_stars, through: :plays, source: :star
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 
  def already_played?(star)
    self.plays.exists?(star_id: star.id)
  end   
  
  has_many :comments, dependent: :destroy
end
