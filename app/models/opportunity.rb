class Opportunity < ApplicationRecord
  belongs_to :user_profile
  belongs_to :job
end
