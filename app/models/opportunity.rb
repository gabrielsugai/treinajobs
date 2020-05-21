class Opportunity < ApplicationRecord
  belongs_to :user_profile
  belongs_to :job

  #enum featured: { user_featured: true, user_not_featured: false }
end
