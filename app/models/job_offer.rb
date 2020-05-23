class JobOffer < ApplicationRecord
  belongs_to :job
  belongs_to :user_profile
end
