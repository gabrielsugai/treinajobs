require 'rails_helper'

feature 'Candidade authentication' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    
    visit root_path
    click_on 'Empresas'
    click_on 'Entrar'
    fill_in 'Email', with: headhunter.email
    fill_in 'Password', with: headhunter.password
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso!')
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
    expect(current_path).to eq(headhunter_root_path) 
  end

  scenario 'log out' do
    headhunter = create(:headhunter)
    login_as headhunter, scope: :headhunter
    visit headhunter_root_path
    click_on 'Sair'

    expect(page).to have_content('Saiu com sucesso.')
    expect(page).not_to have_link('Sair')
    expect(page).to have_link('Entrar')
    expect(current_path).to eq(root_path)
  end
end