class UserProfile < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :opportunities
  has_many :jobs, through: :opportunities
end
