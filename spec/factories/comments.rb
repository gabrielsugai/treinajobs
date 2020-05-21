FactoryBot.define do
  factory :comment do
    text { "Bom perfil" }
    user_profile
    headhunter
  end
end
