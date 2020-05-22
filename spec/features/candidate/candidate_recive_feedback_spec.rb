require 'rails_helper'

feature 'Candidate recive a feedback' do
  scenario 'successfully' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile, 
                          feedback_message: 'Infelizmente seu perfil não nos atende no momento')
    login_as user, scope: :user

    visit root_path
    click_on 'Feedbacks'

    expect(page).to have_content("Vaga: #{job.title}")
    expect(page).to have_content("Feedback: #{opportunity.feedback_message}")
  end

  scenario 'and return to root' do
    user = create(:user)
    profile = create(:user_profile, user: user)
    
    login_as user, scope: :user
    
    visit root_path

    click_on 'Feedbacks'
    click_on 'Voltar'

    expect(current_path).to eq(user_root_path)
  end
end