require 'rails_helper'

feature 'Headhunter cant apply for a job' do
  context 'another headhunter job' do
    scenario 'cant view jobs from another headhunter' do
      headhunter = create(:headhunter)
      job = create(:job)

      login_as headhunter, scope: :headhunter
      visit root_path
      click_on 'Vagas'

      expect(page).not_to have_link(job.title)
    end

    scenario 'cant access form path' do
      headhunter = create(:headhunter)
      job = create(:job)
      login_as headhunter, scope: :headhunter
      visit new_job_opportunity_path(job)

      expect(current_path).to eq(new_user_session_path)
    end

  end

  context 'own jobs' do
    scenario 'from job' do
      headhunter = create(:headhunter)
      job = create(:job, headhunter: headhunter)

      login_as headhunter, scope: :headhunter
      visit root_path
      click_on 'Vagas'
      click_on job.title

      expect(page).not_to have_link('Candidatar-se')
    end

    scenario 'cant access form path' do
      headhunter = create(:headhunter)
      job = create(:job, headhunter: headhunter)
      login_as headhunter, scope: :headhunter
      visit new_job_opportunity_path(job)

      expect(current_path).to eq(new_user_session_path)
    end
  end
end