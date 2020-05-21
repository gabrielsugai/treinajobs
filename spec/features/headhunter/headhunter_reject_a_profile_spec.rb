require 'rails_helper'

feature 'Headhunter reject a Candidates profile' do
  xscenario 'successfully' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)

    login_as headhunter, scope: :headhunter
    
    visit candidates_job_path(job)
    click_on 'Rejeitar'

    fill_in 'Feedback', with: 'Infelizmente seu perfil não é o que procuramos para essa vaga'
    click_on 'Enviar'
    click_on 'Rejeitar candidato'

    expect(page).to have_content('Candidato rejeitado')
    expect(current_path).to eq(headhunter_root_path)
  end
end