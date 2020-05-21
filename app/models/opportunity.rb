class Opportunity < ApplicationRecord
  belongs_to :user_profile
  belongs_to :job

  enum feature: { not_feature: 0, candidate_feature: 1}
end
