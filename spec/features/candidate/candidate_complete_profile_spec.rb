require 'rails_helper'

feature 'Candidate complete profile' do
  scenario 'successfully' do
    user = create(:user)
    login_as user, scope: :user

    visit root_path
    click_on 'Completar Perfil'

    attach_file 'Foto de perfil', './app/assets/images/i_perfil.jpg'
    fill_in 'Nome completo', with: 'Gabriel Sugai'
    fill_in 'Nome social', with: ''
    fill_in 'Data de nascimento', with: '05/12/1997'
    fill_in 'Formação', with: 'Tecnologo em Mecatronica'
    fill_in 'Descrição', with: 'blablabla'
    fill_in 'Experiencia', with: 'blablabla'
    click_on 'Salvar'

    expect(page).to have_content('Perfil completado com sucesso!')
    expect(page).not_to have_content('Você precisa completar o seu perfil para continuar!')
    expect(page).not_to have_link('Completar Perfil')
  end
end