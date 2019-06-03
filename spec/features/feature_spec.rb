feature 'can display content' do
  scenario 'says hello' do
    visit('/')

    expect(page).to have_content('Bookmark!')
  end
end

feature 'can view bookmarks' do
  scenario 'click on view bookmarks and see bookmarks' do
    visit('/')
    click_on 'View bookmarks'

    expect(page).to have_content('Your bookmarks:')
  end
end
