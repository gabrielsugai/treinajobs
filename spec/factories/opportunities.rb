FactoryBot.define do
  factory :opportunity do
    user_profile
    job
    text { "MyString" }
    feature { 0 }
  end
end
