require 'rails_helper'

feature 'Candidate cant view denied offers' do
  scenario 'successfully' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)
    offer = create(:job_offer, job: job, user_profile: profile, salary: 1500.0, status: 1)

    login_as user, scope: :user
    visit user_root_path
    click_on 'Propostas'

    expect(page).not_to have_link(job.title)
  end
end