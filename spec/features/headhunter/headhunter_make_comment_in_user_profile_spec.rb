require 'rails_helper'

feature 'Headhunter can comment on user profile' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    user_profile = create(:user_profile)
    job = create(:job, headhunter: headhunter)
    opportunity = create(:opportunity, job: job, user_profile: user_profile)

    login_as headhunter, scope: :headhunter

    visit user_profile_path(user_profile)

    fill_in 'Digite aqui:', with: 'Gostei das suas habilidades'
    click_on 'Comentar'

    expect(page).to have_content('Gostei das suas habilidades')
    expect(current_path).to eq(user_profile_path(user_profile))
  end

  scenario 'and comment canot be blank' do
    headhunter = create(:headhunter)
    user_profile = create(:user_profile)
    job = create(:job, headhunter: headhunter)
    opportunity = create(:opportunity, job: job, user_profile: user_profile)

    login_as headhunter, scope: :headhunter

    visit user_profile_path(user_profile)

    fill_in 'Digite aqui:', with: ''
    click_on 'Comentar'

    expect(page).to have_content('Comentario não pode ficar em branco')
  end
end  