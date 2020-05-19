require 'rails_helper'

feature 'Candidate can apply to a job' do
  xscenario 'successfully' do
    user = create(:user)
    user_profile = create(:user_profile, user_id: user.id)
    job = create(:job)
    login_as user, scope: :user

    visit root_path
    click_on 'Vagas disponiveis'
    click_on job.title

  end
end