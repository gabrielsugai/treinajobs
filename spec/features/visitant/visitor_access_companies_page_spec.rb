require 'rails_helper'

feature 'Visitor access companies page' do
  scenario 'Successfully' do
    visit root_path
    click_on 'Empresas'
    expect(page).to have_content('Bem vindo a seção para recrutadores')
  end
end