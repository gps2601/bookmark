require 'bookmarker'
require 'bookmark'

describe Bookmarker do
  describe '#initialize' do
    it 'can be initialized with bookmarks' do
      bookmarks_double = double('bookmarks_double')
      my_bookmarker = Bookmarker.new(bookmarks_double)

      expect(my_bookmarker.bookmarks).to eq(bookmarks_double)
    end

    it 'can be initialized without bookmarks' do
      my_bookmarker = Bookmarker.new

      expect(my_bookmarker.bookmarks).to be_empty
    end
  end

  describe '#all' do

    it 'calls has entries in the database' do
      bookmarks = Bookmarker.all
      expect(bookmarks.find { |bookmark| bookmark.name == 'Google' }).to_not be(nil)
      expect(bookmarks.find { |bookmark| bookmark.name == 'Youtube' }).to_not be(nil)
      expect(bookmarks.find { |bookmark| bookmark.name == 'Destroy software' }).to_not be(nil)
      expect(bookmarks.find { |bookmark| bookmark.name == 'added title' }).to be(nil)
    end
  end

  describe '#create' do
    it 'can add an entry to the database' do
      Bookmarker.create('added title', 'www.added-url.co.uk')
      bookmarks = Bookmarker.all

      expect(bookmarks.find { |bookmark| bookmark.name == 'added title' }).to_not be(nil)
    end
  end
end
