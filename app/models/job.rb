class Job < ApplicationRecord
  belongs_to :headhunter
  has_many :opportunities
  has_many :job_offers
  has_many :user_profiles, through: :opportunities

  validates :title, :description, :skills, :salary, :level, :limit_date, :local, presence: true

  enum status: {opened: 0, ended: 1}

  
end
