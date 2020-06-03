require 'rails_helper'

feature 'Visitor authorization' do
  scenario 'cant access job#index' do
    visit jobs_path

    expect(current_path).to eq(root_path)
  end
  
  scenario 'cant access job#new ' do
    visit new_job_path

    expect(current_path).to eq(root_path)
  end

  scenario 'cant access job#show' do
    job = create(:job)
    
    visit job_path(job)

    expect(current_path).to eq(root_path)
  end

  scenario 'cant access job#candidates' do
    job = create(:job)
    visit candidates_job_path(job)

    expect(current_path).to eq(root_path)
  end

  scenario 'cant end a job' do
    job = create(:job)
    visit end_job_job_path(job)

    expect(current_path).to eq(root_path)
  end

  scenario 'cant view applyed jobs' do
    visit myapplys_user_profiles_path

    expect(current_path).to eq(root_path)
  end

  scenario 'cant create a profile' do
    visit new_user_profile_path

    expect(current_path).to eq(root_path)
  end

  scenario 'cant view a profile' do
    profile = create(:user_profile)
    visit user_profile_path(profile)

    expect(current_path).to eq(root_path)
  end

  scenario 'cant view job_offers#index' do
    job = create(:job)
    visit job_job_offers_path(job)

    expect(current_path).to eq(root_path)
  end

  scenario 'cant create a job_offer' do
    job = create(:job)
    visit new_job_job_offer_path(job)
    
    expect(current_path).to eq(root_path)
  end

  scenario 'cant view an offer' do
    job = create(:job)
    offer = create(:job_offer, job: job)
    visit job_job_offer_path(offer, job)
    
    expect(current_path).to eq(root_path)
  end

  scenario 'cant view opportunities' do
    job = create(:job)
    visit job_opportunities_path(job)

    expect(current_path).to eq(root_path)
  end

  scenario 'cant create an opportunity' do
    job = create(:job)
    visit new_job_opportunity_path(job)

    expect(current_path).to eq(root_path)
  end

  scenario 'cant view headhunter feedbacks' do
    job = create(:job)
    opportunity = create(:opportunity, job: job)

    visit feedback_job_opportunity_path(opportunity, job)

    expect(current_path).to eq(root_path)
  end
end