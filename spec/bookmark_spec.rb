require 'bookmark'

describe Bookmark do
  it 'can store a bookmark with a name' do
    my_bookmark = Bookmark.new('id', 'bookmark name', 'bookmark url')

    expect(my_bookmark.name).to eq('bookmark name')
  end

  it 'can store a bookmark with a url' do
    my_bookmark = Bookmark.new('id', 'bookmark name', 'bookmark url')

    expect(my_bookmark.url).to eq('bookmark url')
  end

  it 'can store a bookmark with an id' do
    my_bookmark = Bookmark.new('id', 'bookmark name', 'bookmark url')

    expect(my_bookmark.id).to eq('id')
  end
end
