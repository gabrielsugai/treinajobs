require 'rails_helper'

feature 'Candidate can create an account' do
  scenario 'successfully' do
    
    visit root_path
    click_on 'Registrar'

    fill_in 'Email', with: 'teste@teste.com.br'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    expect(page).to have_content('Login efetuado com sucesso.')
    expect(page).to have_link('Sair')
    expect(current_path).to eq(root_path)
  end
end