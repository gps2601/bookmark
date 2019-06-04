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

    expect(page).to have_content('Google')
    expect(page).to have_content('Youtube')
    expect(page).to have_content('Destroy software')
  end
end

feature 'can add a bookmark' do
  scenario 'click on add book, fill in form and see the bookmark added' do
    visit('/bookmarks/new')

    fill_in 'url', with: 'wwww.added-bookmark.com'
    fill_in 'title', with: 'Added Bookmark'

    click_button('Submit')

    expect(page).to have_link('Added Bookmark', href: 'wwww.added-bookmark.com')
  end
end

feature 'can delete a bookmark' do
  scenario 'on bookmarks, click on remove bookmark - bookmark is deleted' do
    visit('/bookmarks')
    find("input[id='1']").click

    expect(page).to have_content('Youtube')
    expect(page).to have_content('Destroy software')
    expect(page).to_not have_content('Google')
  end
end
