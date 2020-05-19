require 'rails_helper'

feature 'Candidate can view available jobs' do
  scenario 'successfully' do
    user = create(:user)
    user_profile = create(:user_profile, user_id: user.id)
    job = create(:job)
    another_job = create(:job)
    login_as user, scope: :user

    visit root_path
    click_on 'Vagas disponiveis'
    
    expect(page).to have_content(job.title)
    expect(page).to have_content(another_job.title)  
  end

  scenario 'and view details' do
    user = create(:user)
    user_profile = create(:user_profile, user_id: user.id)
    job = create(:job)
    another_job = create(:job)
    login_as user, scope: :user

    visit root_path
    click_on 'Vagas disponiveis'
    click_on job.title

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.description)
    expect(page).to have_content(job.skills)
    expect(page).to have_content(job.salary)
    expect(page).to have_content(job.level)
    expect(page).to have_content(I18n.l(job.limit_date))
    expect(page).to have_content(job.local)

    expect(page).not_to have_content(another_job.title)
  end

  scenario 'and back to jobs' do
    user = create(:user)
    user_profile = create(:user_profile, user_id: user.id)
    job = create(:job)
    login_as user, scope: :user

    visit job_path(job)
    
    click_on 'Voltar'

    expect(current_path).to eq(jobs_path)
  end

  scenario 'and back to root' do
    user = create(:user)
    user_profile = create(:user_profile, user_id: user.id)
    job = create(:job)
    login_as user, scope: :user

    visit jobs_path
    click_on 'Voltar'

    expect(current_path).to eq(user_root_path)
  end
end