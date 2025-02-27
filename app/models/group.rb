class Group < ApplicationRecord
  has_one_attached :group_pic
  validates :name, :city, presence: true
  validates :name, uniqueness: true


  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :messages, dependent: :destroy
end
