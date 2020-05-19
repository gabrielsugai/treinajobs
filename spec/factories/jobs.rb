FactoryBot.define do
  factory :job do
    title { "MyString" }
    description { "MyString" }
    skills { "MyString" }
    salary { "MyString" }
    level { "MyString" }
    limit_date { "2020-05-19" }
    local { "MyString" }
    headhunter { create(:headhunter) }
  end
end
