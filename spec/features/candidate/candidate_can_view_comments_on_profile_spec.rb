require 'rails_helper' 

feature 'Candidate view comments on own profile' do
  scenario 'successfully' do
    user = create(:user)
    user_profile = create(:user_profile, user: user)
    comment = create(:comment, user_profile: user_profile)

    login_as user, scope: :user

    visit user_profile_path(user_profile)

    expect(page).to have_content('Comentarios:')
    expect(page).to have_content(comment.text)
    expect(page).to have_content(I18n.l(comment.created_at))
  end
end