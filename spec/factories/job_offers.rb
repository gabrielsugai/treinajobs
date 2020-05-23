FactoryBot.define do
  factory :job_offer do
    start_date { "2020-05-22" }
    salary { "9.99" }
    benefits { "MyString" }
    function { "MyString" }
    expectations { "MyString" }
    status { 1 }
    job { nil }
    user_profile { nil }
  end
end
