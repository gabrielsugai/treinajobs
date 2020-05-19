FactoryBot.define do
  factory :job do
    sequence(:title) { |n| "Job#{n}"}
    description { "Vaga de emprego" }
    skills { "Habilidades" }
    salary { "reais" }
    level { "junior" }
    limit_date { "#{1.day.from_now}" }
    local { "Sao paulo" }
    headhunter { create(:headhunter) }
  end
end