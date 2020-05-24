class Job < ApplicationRecord
  belongs_to :headhunter
  has_many :opportunities
  has_many :job_offers
  has_many :user_profiles, through: :opportunities
end
