FactoryBot.define do
  factory :opportunity do
    user_profile
    job
    text { "MyString" }
  end
end
