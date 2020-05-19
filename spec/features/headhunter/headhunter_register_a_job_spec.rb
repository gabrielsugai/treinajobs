require 'rails_helper'

feature 'Headhunter register a job' do
  scenario 'successfully' do
    headhunter = create(:headhunter)

    login_as headhunter, scope: :headhunter

    visit root_path
    click_on 'Cadastrar nova vaga'
    fill_in 'Titulo', with: 'Dev'
    fill_in 'Descrição da vaga', with: 'Corrigir bugs e desenvolver novas aplicações'
    fill_in 'Habilidades desejadas', with: 'Habilidade de resolver problemas'
    fill_in 'Faixa salarial', with: '1500-2000'
    fill_in 'Nivel da vaga', with: 'Junior'
    fill_in 'Data limite', with: '24/05/2020'
    fill_in 'Local', with: 'Sao paulo'
    click_on 'Registrar'

    expect(page).to have_content('Dev')
    expect(page).to have_content('Descrição da vaga: Corrigir bugs e desenvolver novas aplicações')
    expect(page).to have_content('Habilidades desejadas: Habilidade de resolver problemas')
    expect(page).to have_content('Faixa salarial: 1500-2000')
    expect(page).to have_content('Nivel da vaga: Junior')
    expect(page).to have_content('Data limite: 24/05/2020')
    expect(page).to have_content('Local: Sao paulo')
    expect(page).to have_link('Voltar')
    
  end

  scenario 'and back to jobs index' do
    headhunter = create(:headhunter)
    job = create(:job)
    login_as headhunter, scope: :headhunter

    visit job_path(job)
    click_on 'Voltar'
    expect(current_path).to eq(jobs_path)
  end
end