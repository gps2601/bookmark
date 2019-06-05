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

    fill_in 'url', with: 'https://wwww.added-bookmark.com'
    fill_in 'title', with: 'Added Bookmark'

    click_button('Submit')

    expect(page).to have_link('Added Bookmark', href: 'https://wwww.added-bookmark.com')
  end
end

feature 'can delete a bookmark' do
  scenario 'on bookmarks, click on remove bookmark - bookmark is deleted' do
    visit('/bookmarks')
    find("input[id='delete-1']").click

    expect(page).to have_content('Youtube')
    expect(page).to have_content('Destroy software')
    expect(page).to_not have_content('Google')
  end
end

feature 'it can validate an url' do
  scenario 'email is invalid' do
    visit('/bookmarks/new')

    fill_in 'url', with: 'not valid url'
    fill_in 'title', with: 'Invalid Url Title'
    click_button('Submit')

    expect(page).to have_content('Invalid URL')
  end
end

feature 'can comment on a bookmark' do
  scenario 'click on add comment and comment is then visible on the page' do
    visit('/bookmarks')
    within(find_by_id('comment-1')) do
      fill_in 'comment', with: 'this is my comment for element 1'
      click_on 'comment-submit'
    end

    expect(page).to have_content('this is my comment for element 1')
  end
end

feature 'can add a tag to a bookmark' do
  scenario 'click on add tag and tag is then visible under that bookmark' do
    visit('/bookmarks')
    within(find_by_id('bookmark-1')) do
      fill_in 'tag', with: 'drinks'
      click_on 'tag-submit'
    end
    expect(page).to have_content('drinks')
  end
end
