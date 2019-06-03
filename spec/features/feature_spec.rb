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

  scenario 'click on view bookmarks and see bookmarks' do
    visit('/')
    click_on 'View bookmarks'

    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.youtube.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end
end

feature 'can add bookmark' do
  scenario 'click on add book, fill in form and see the bookmark added' do
    visit('/')
    click_on 'Add bookmark'

    fill_in 'url', with: 'wwww.added-bookmark.com'
    click_on 'Submit bookmark'

    expect(page).to have_content('wwww.added-bookmark.com')
  end
end
