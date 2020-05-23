FactoryBot.define do
  factory :job_offer do
    start_date { "#{1.day.from_now}" }
    salary { 1500 }
    benefits { "VT, VA, Plano de saude" }
    function { "Dev rails junior" }
    expectations { "Esperamos que de o seu melhor para ajudar a empresa" }
    status { 0 }
    job
    user_profile
  end
end
