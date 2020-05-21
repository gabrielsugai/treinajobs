class Comment < ApplicationRecord
  belongs_to :user_profile
  belongs_to :headhunter
end
