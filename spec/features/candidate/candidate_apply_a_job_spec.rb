require 'rails_helper'

feature 'Candidate can apply to a job' do
  scenario 'successfully' do
    user = create(:user)
    user_profile = create(:user_profile, user_id: user.id)
    job = create(:job)
    login_as user, scope: :user

    visit job_path(job)
    click_on 'Candidatar-se'
    fill_in 'Fale de você', with: 'Meu nome e Gabriel'
    click_on 'Finalizar'

    expect(page).to have_content('Processo realizado com sucesso!')
    expect(current_path).to eq(user_root_path)
  end

  scenario 'and fields canot be blank' do
    user = create(:user)
    user_profile = create(:user_profile, user_id: user.id)
    job = create(:job)
    login_as user, scope: :user

    visit job_path(job)
    click_on 'Candidatar-se'
    fill_in 'Fale de você', with: ''
    click_on 'Finalizar'

    expect(page).to have_content('Mensagem não pode ficar em branco')
  end
  
  scenario 'and can view all applied jobs' do
    user = create(:user)
    user_profile = create(:user_profile, user_id: user.id)
    job = create(:job)
    login_as user, scope: :user

    visit job_path(job)
    click_on 'Candidatar-se'
    fill_in 'Fale de você', with: 'Meu nome e Gabriel'
    click_on 'Finalizar'

    click_on 'Minhas vagas'
    
    expect(page).to have_content(job.title)
  end
end