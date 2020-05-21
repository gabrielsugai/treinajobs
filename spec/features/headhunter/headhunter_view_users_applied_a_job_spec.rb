require 'rails_helper'

feature 'Headhunter can view all users who applied to a job' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    user_profile = create(:user_profile)
    another_profile = create(:user_profile)
    opportunity = create(:opportunity, job:job, user_profile:user_profile)
    opportunity_b = create(:opportunity, job:job, user_profile:another_profile)

    login_as headhunter, scope: :headhunter

    visit root_path
    click_on 'Vagas cadastradas'
    click_on job.title
    click_on 'Candidatos'

    expect(page).to have_content('Candidatos cadastrados na sua vaga')
    expect(page).to have_content(user_profile.name)
    expect(page).to have_content(another_profile.name)
  end

  scenario 'and can view candidate profiles' do
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    user_profile = create(:user_profile)
    another_profile = create(:user_profile)
    opportunity = create(:opportunity, job:job, user_profile:user_profile)
    opportunity_b = create(:opportunity, job:job, user_profile:another_profile)

    login_as headhunter, scope: :headhunter

    visit root_path
    click_on 'Vagas cadastradas'
    click_on job.title
    click_on 'Candidatos'
    click_on user_profile.name

    expect(page).to have_content(user_profile.name)
    expect(page).to have_content(user_profile.social_name)
    expect(page).to have_content(I18n.l(user_profile.date_of_birth))
    expect(page).to have_content(user_profile.schooling)
    expect(page).to have_content(user_profile.description)
    expect(page).to have_content(user_profile.experience)
  end

  scenario 'and return to root_path' do
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    user_profile = create(:user_profile)
    another_profile = create(:user_profile)
    opportunity = create(:opportunity, job:job, user_profile:user_profile)
    opportunity_b = create(:opportunity, job:job, user_profile:another_profile)

    login_as headhunter, scope: :headhunter

    visit root_path
    click_on 'Vagas cadastradas'
    click_on job.title
    click_on 'Candidatos'
    click_on user_profile.name
    
    click_on 'Voltar'

    expect(current_path).to eq(headhunter_root_path)
  end
end