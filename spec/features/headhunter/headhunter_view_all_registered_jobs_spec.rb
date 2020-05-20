require 'rails_helper'

feature 'Headhunter can view all registered jobs' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    another_headhunter = create(:headhunter)
    job_a = create(:job, headhunter: headhunter)
    job_b = create(:job, headhunter: headhunter)
    another_job = create(:job, headhunter: another_headhunter)
    login_as headhunter, scope: :headhunter

    visit root_path
    click_on 'Vagas cadastradas'

    expect(page).to have_link(job_a.title)
    expect(page).to have_link(job_b.title)
  end
  scenario 'and cant view jobs from another headhunter' do
    headhunter = create(:headhunter)
    another_headhunter = create(:headhunter)
    job_a = create(:job, headhunter: headhunter)
    job_b = create(:job, headhunter: headhunter)
    another_job = create(:job, headhunter: another_headhunter)
    login_as headhunter, scope: :headhunter

    visit root_path
    click_on 'Vagas cadastradas'

    expect(page).not_to have_link(another_job.title)
  end
end