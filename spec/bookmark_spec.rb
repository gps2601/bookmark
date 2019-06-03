require 'bookmark'

describe Bookmark do
  it 'can store a bookmark with a name' do
    my_bookmark = Bookmark.new('bookmark name')

    expect(my_bookmark.name).to eq('bookmark name')
  end

  it 'can store a bookmark with a different name' do
    my_bookmark = Bookmark.new('different name')

    expect(my_bookmark.name).to eq('different name')
  end
end
