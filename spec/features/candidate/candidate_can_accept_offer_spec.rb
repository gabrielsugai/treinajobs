require 'rails_helper'

feature 'Candidate can accept an offer' do
  scenario 'successfully' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)
    offer = create(:job_offer, job: job, user_profile: profile, salary: 1500.0)

    login_as user, scope: :user
    visit user_root_path
    click_on 'Propostas'
    click_on job.title
    click_on 'Aceitar proposta'
    
    fill_in 'Observação', with: 'Obrigado pela oportunidade'
    click_on 'Finalizar'

    expect(page).to have_content('Processo finalizado com sucesso!')
  end
end