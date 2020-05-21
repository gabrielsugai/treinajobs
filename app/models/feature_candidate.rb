class FeatureCandidate < ApplicationRecord
  belongs_to :user_profile
  belongs_to :job
end
