require 'bookmarker'

describe Bookmarker do
  describe '#initialize' do
    it 'can store a bookmark with a name' do
      my_bookmark = Bookmarker.new('id', 'bookmark name', 'bookmark url')

      expect(my_bookmark.name).to eq('bookmark name')
    end

    it 'can store a bookmark with a url' do
      my_bookmark = Bookmarker.new('id', 'bookmark name', 'bookmark url')

      expect(my_bookmark.url).to eq('bookmark url')
    end

    it 'can store a bookmark with an id' do
      my_bookmark = Bookmarker.new('id', 'bookmark name', 'bookmark url')

      expect(my_bookmark.id).to eq('id')
    end
  end

  describe '#all' do
    it 'calls has entries in the database' do
      DatabaseConnection.setup('bookmark_manager_test')
      bookmarks = Bookmarker.all
      expect(bookmarks.find { |bookmark| bookmark.name == 'Google' }).to_not be(nil)
      expect(bookmarks.find { |bookmark| bookmark.name == 'Youtube' }).to_not be(nil)
      expect(bookmarks.find { |bookmark| bookmark.name == 'Destroy software' }).to_not be(nil)
      expect(bookmarks.find { |bookmark| bookmark.name == 'added title' }).to be(nil)
    end
  end

  describe '#create' do
    it 'can add an entry to the database' do
      Bookmarker.create('added title', 'https://www.added-url.co.uk')
      bookmarks = Bookmarker.all

      expect(bookmarks.find { |bookmark| bookmark.name == 'added title' }).to_not be(nil)
    end

    it 'wont add an entry if the URL is not valid' do
      Bookmarker.create('bad bookmark', 'im a bad bookmark')
      stored_bookmarks = Bookmarker.all
      expect(stored_bookmarks.find{|bookmark| bookmark.name == 'bad bookmark'}).to be(nil)
    end
  end
end
