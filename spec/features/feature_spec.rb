feature 'can display content' do
  scenario 'says hello' do
    visit('/')

    expect(page).to have_content('Hello world!')
  end
end
