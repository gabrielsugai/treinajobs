require 'rails_helper'

feature 'Candidate can view his own profile' do
  scenario 'successfully' do
    user = create(:user)
    profile = create(:user_profile, user: user)
    login_as user, scope: :user

    visit root_path
    click_on 'Meu perfil'

    expect(page).to have_content(profile.name)
    expect(page).to have_content(profile.social_name)
    expect(page).to have_content(I18n.l(profile.date_of_birth))
    expect(page).to have_content(profile.schooling)
    expect(page).to have_content(profile.description)
    expect(page).to have_content(profile.experience)
  end

  scenario 'and return to root' do
    user = create(:user)
    profile = create(:user_profile, user: user)
    login_as user, scope: :user

    visit root_path
    click_on 'Meu perfil'

    click_on 'Voltar'

    expect(current_path).to eq(user_root_path)
  end
end