FactoryBot.define do
  factory :opportunity do
    user_profile { nil }
    job { nil }
    text { "MyString" }
  end
end
