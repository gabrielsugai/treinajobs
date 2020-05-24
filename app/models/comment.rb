class Comment < ApplicationRecord
  belongs_to :user_profile
  belongs_to :headhunter

  validates :text, presence: {message: 'Comentario não pode ficar em branco'}
end
