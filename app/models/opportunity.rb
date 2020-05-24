class Opportunity < ApplicationRecord
  belongs_to :user_profile
  belongs_to :job

  validates :text, presence: true
  enum feature: { not_feature: 0, candidate_feature: 1, rejected: 2}
end
