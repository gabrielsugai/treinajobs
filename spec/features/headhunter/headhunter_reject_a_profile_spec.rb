require 'rails_helper'

feature 'Headhunter send a feedback' do
  scenario 'successfully' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)

    login_as headhunter, scope: :headhunter
    
    visit candidates_job_path(job)
  
    fill_in 'Feedback', with: 'Infelizmente seu perfil não é o que procuramos para essa vaga'
    click_on 'Enviar e rejeitar perfil'

    expect(page).to have_content('Mensagem enviada com sucesso!')
    expect(page).to have_content('Perfil rejeitado')
    expect(current_path).to eq(candidates_job_path(job))
  end
end