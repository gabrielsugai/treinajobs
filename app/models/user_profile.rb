class UserProfile < ApplicationRecord
  has_one_attached :avatar
  belongs_to :user
  has_many :comments
  has_many :opportunities
  has_many :job_offers
  has_many :jobs, through: :opportunities

  validates :name, :date_of_birth, :schooling, :description, 
            :experience, presence: true

end
