FactoryBot.define do
  factory :opportunity do
    user_profile
    job
    text { "MyString" }
    feedback_message { '' }
    feature { 0 }
  end
end
