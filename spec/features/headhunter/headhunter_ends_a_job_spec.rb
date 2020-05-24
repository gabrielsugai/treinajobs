require 'rails_helper'

feature 'Headhunter can view all registered jobs' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    another_headhunter = create(:headhunter)
    job_a = create(:job, headhunter: headhunter)
    job_b = create(:job, headhunter: headhunter)
    another_job = create(:job, headhunter: another_headhunter)
    login_as headhunter, scope: :headhunter

    visit root_path
    click_on 'Vagas cadastradas'
    click_on job_a.title

    click_on 'Encerrar vaga'

    expect(page).to have_content('Processo finalizado com sucesso!')
    expect(current_path).to eq(headhunter_root_path)
  end
end