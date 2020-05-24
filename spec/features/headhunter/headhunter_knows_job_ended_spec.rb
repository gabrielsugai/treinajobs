require 'rails_helper'

feature 'Headhunter view ended jobs by limit date' do
  scenario 'successfully' do
    user = create(:user)
    profile = create(:user_profile, user: user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter, status: 0, limit_date: Date.yesterday)

    login_as headhunter, scope: :headhunter
    visit headhunter_root_path
    click_on 'Vagas cadastradas'

    expect(page).to have_content(job.title)
    expect(page).not_to have_link(job.title)
    expect(page).to have_content('Processo encerrado!')
  end
end