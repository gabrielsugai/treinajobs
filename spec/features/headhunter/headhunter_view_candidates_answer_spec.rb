require 'rails_helper'

feature 'Headhunter view candidates feedbacks' do
  scenario 'accepted offer' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)
    offer = create(:job_offer, job: job, user_profile: profile, salary: 1500.0, status: 2, 
                    message: 'Obrigado pela proposta')

    login_as headhunter, scope: :headhunter
    visit headhunter_root_path
    click_on 'Feedback de propostas'

    expect(page).to have_content("Vaga: #{job.title}")
    expect(page).to have_content('Status: Proposta Aceita')
    expect(page).to have_content("Candidato: #{profile.name}")
    expect(page).to have_content("Mensagem: #{offer.message}")
  end

  scenario 'denied offer' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)
    offer = create(:job_offer, job: job, user_profile: profile, salary: 1500.0, status: 1, 
                  message: '')

    login_as headhunter, scope: :headhunter
    visit headhunter_root_path
    click_on 'Feedback de propostas'

    expect(page).to have_content("Vaga: #{job.title}")
    expect(page).to have_content('Status: Proposta Recusada')
    expect(page).to have_content("Candidato: #{profile.name}")
    expect(page).to have_content("Mensagem:")
  end
end