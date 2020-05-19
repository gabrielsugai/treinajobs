FactoryBot.define do
  factory :user_profile do
    sequence(:name) { |n| "Gabriel#{n}"}
    social_name { '' }
    date_of_birth { "05/12/1997" }
    schooling { "Tecnologo" }
    description { "Descricao" }
    experience { "trabalhei..." }
    user_id { create(:user) }
  end
end
