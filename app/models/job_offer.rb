class JobOffer < ApplicationRecord
  belongs_to :job
  belongs_to :user_profile
  
  enum status: {pending: 0, denied: 1, accepted: 2}
  validates :start_date, :salary, :benefits, :function, :expectations, presence: true
end
