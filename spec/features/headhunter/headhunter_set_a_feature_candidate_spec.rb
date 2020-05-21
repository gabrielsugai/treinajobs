require 'rails_helper'

feature 'Headhunter set a candidate as a feature' do
  scenario 'successfully' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)

    login_as headhunter, scope: :headhunter
    
    visit candidates_job_path(job)
    click_on 'Destacar'

    expect(current_path).to eq(candidates_job_path(job))
    expect(page).to have_content('Candidato destacado')
  end
  scenario ' and remove de feature' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile, feature: 1)

    login_as headhunter, scope: :headhunter
    
    visit candidates_job_path(job)
    click_on 'Destacar'

    expect(current_path).to eq(candidates_job_path(job))
    expect(page).not_to have_content('Candidato destacado')
  end
end