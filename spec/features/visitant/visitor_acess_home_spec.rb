require 'rails_helper'

feature 'Visitant acess root' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Bem vindo ao Treina Jobs!')
  end
end