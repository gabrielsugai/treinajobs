require 'rails_helper'

feature 'Headhunter send a job offer to a cnadidate' do
  scenario 'successfully' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)

    login_as headhunter, scope: :headhunter

    visit candidates_job_path(job)
    click_on 'Enviar proposta'
    
    select profile.name, from: 'Candidato'
    fill_in 'Data de início', with: '01/06/2020'
    fill_in 'Salário', with: 1500
    fill_in 'Benefícios', with: 'VT, VA, Plano de saude'
    fill_in 'Função', with: 'Dev rails junior'
    fill_in 'Nossas expectativas', with: 'Esperamos que de o seu melhor para ajudar a empresa'
    click_on 'Enviar proposta'

    expect(page).to have_content('Proposta enviar com sucesso!')
    expect(current_path).to have_content(headhunter_root_path)
  end
end