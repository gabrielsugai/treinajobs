require 'rails_helper'

feature 'Authorization' do
  context 'visitor' do
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

  context 'user without profile' do
    scenario 'successfully' do
      user = create(:user)
      login_as user, scope: :user
      visit new_user_profile_path

      expect(current_path).to eq(new_user_profile_path)
    end

    scenario 'cant view a profile withou a profile' do
      user = create(:user)
      login_as user, scope: :user
      visit user_profile_path(user)

      expect(current_path).to eq(user_root_path)
      expect(page).to have_content('Você precisa completar o seu perfil para continuar!')
    end

    scenario 'cant access applyed jobs' do
      user = create(:user)
      login_as user, scope: :user
      visit myapplys_user_profiles_path

      expect(current_path).to eq(user_root_path)
      expect(page).to have_content('Você precisa completar o seu perfil para continuar!')
    end

    scenario 'cant view jobs' do
      user = create(:user)
      login_as user, scope: :user
      visit jobs_path

      expect(current_path).to eq(user_root_path)
      expect(page).to have_content('Você precisa completar o seu perfil para continuar!')
    end

    scenario 'cant view offers' do
      user = create(:user)
      login_as user, scope: :user
      visit job_job_offers_path(user)

      expect(current_path).to eq(user_root_path)
      expect(page).to have_content('Você precisa completar o seu perfil para continuar!')
    end

    scenario 'cant view feedbacks' do
      user = create(:user)
      login_as user, scope: :user
      visit job_opportunities_path(user)

      expect(current_path).to eq(user_root_path)
      expect(page).to have_content('Você precisa completar o seu perfil para continuar!')
    end

    scenario 'cant view opportunities' do
      user = create(:user)
      login_as user, scope: :user
      visit job_opportunities_path(user)

      expect(current_path).to eq(user_root_path)
      expect(page).to have_content('Você precisa completar o seu perfil para continuar!')
    end
  end

  context 'user' do
    scenario 'user cant start a job' do
      user = create(:user)
      profile = create(:user_profile, user: user)
      login_as user, scope: :user
      visit new_job_path

      expect(current_path).to eq(new_headhunter_session_path)
    end

    scenario 'user cant view candidates for a job' do
      user = create(:user)
      profile = create(:user_profile, user: user)
      job = create(:job)
      login_as user, scope: :user
      visit candidates_job_path(job)

      expect(current_path).to eq(new_headhunter_session_path)
    end

    scenario 'user cant send a job offer' do
      user = create(:user)
      profile = create(:user_profile, user: user)
      job = create(:job)
      login_as user, scope: :user
      visit new_job_job_offer_path(job)

      expect(current_path).to eq(new_headhunter_session_path)
    end
  end
end