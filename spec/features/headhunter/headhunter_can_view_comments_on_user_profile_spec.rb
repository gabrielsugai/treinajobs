require 'rails_helper' 

feature 'Headhunter view comments on user_profile' do
  scenario 'successfully' do
    user_profile = create(:user_profile)
    headhunter = create(:headhunter)
    comment = create(:comment, user_profile: user_profile, headhunter: headhunter)

    login_as headhunter, scope: :headhunter

    visit user_profile_path(user_profile)

    expect(page).to have_content('Comentarios:')
    expect(page).to have_content(comment.text)
    expect(page).to have_content(I18n.l(comment.created_at))
  end
end