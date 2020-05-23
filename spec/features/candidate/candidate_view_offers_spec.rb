require 'rails_helper'

feature 'Candidate view job offers' do
  scenario 'successfully' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)
    offer = create(:job_offer, job: job, user_profile: profile, salary: 1500.0)
    another_offer = create(:job_offer, user_profile: profile)

    login_as user, scope: :user
    visit user_root_path
    click_on 'Propostas'

    expect(page).to have_link(offer.job.title)
    expect(page).to have_link(another_offer.job.title)

  end

  scenario 'and view details' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)
    offer = create(:job_offer, job: job, user_profile: profile, salary: 1500.0)

    login_as user, scope: :user
    visit user_root_path
    click_on 'Propostas'
    click_on job.title

    expect(page).to have_content(offer.job.title)
    expect(page).to have_content("Data de início: #{I18n.l(offer.start_date)}")
    expect(page).to have_content("Salário: R$ 1.500,00")
    expect(page).to have_content("Beneficios: #{offer.benefits}")
    expect(page).to have_content("Função: #{offer.function}")
    expect(page).to have_content("Nossas expectativas: #{offer.expectations}")
  end

  scenario 'view details and back to offers' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)
    offer = create(:job_offer, job: job, user_profile: profile, salary: 1500.0)

    login_as user, scope: :user
    visit user_root_path
    click_on 'Propostas'
    click_on job.title
    click_on 'Voltar'

    expect(current_path).to eq(job_job_offers_path(job))
  end

  scenario 'and back do root' do
    user = create(:user)
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    profile = create(:user_profile, user: user)
    opportunity = create(:opportunity, job: job, user_profile: profile)
    offer = create(:job_offer, job: job, user_profile: profile, salary: 1500.0)

    login_as user, scope: :user
    visit user_root_path
    click_on 'Propostas'
    click_on 'Voltar'

    expect(current_path).to eq(user_root_path)
  end
end