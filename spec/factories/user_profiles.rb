FactoryBot.define do
  factory :user_profile do
    name { "MyString" }
    social_name { "MyString" }
    date_of_birth { "2020-05-18" }
    schooling { "MyString" }
    description { "MyString" }
    experience { "MyString" }
    user_id { create(:user) }
  end
end
