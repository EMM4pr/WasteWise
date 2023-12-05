class User < ApplicationRecord
  has_many :disposal_records
  has_many :waste_items, dependent: :destroy
  has_one_attached :photo
  # has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def level
    
  end
end
