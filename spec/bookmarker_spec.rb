require 'bookmarker'

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

      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.youtube.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
    end
  end

  describe '#create' do
    it 'can add an entry to the database' do
      Bookmarker.create('www.added-url.co.uk')
      bookmarks = Bookmarker.all

      expect(bookmarks).to include('www.added-url.co.uk')
    end
  end
end
