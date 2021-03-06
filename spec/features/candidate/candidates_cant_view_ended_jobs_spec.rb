require 'rails_helper'

feature 'Candidates cant view ended jobs' do
  scenario 'successfully' do
    user = create(:user)
    profile = create(:user_profile, user: user)
    headhunter = create(:headhunter)
    another_headhunter = create(:headhunter)
    job_a = create(:job, headhunter: headhunter, status: 1)
    job_b = create(:job, headhunter: another_headhunter, status: 0)

    login_as user, scope: :user
    visit user_root_path
    click_on 'Vagas disponiveis'

    expect(page).to have_link(job_b.title)
    expect(page).not_to have_link(job_a.title)
  end
end