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
    it 'returns a hardcoded list of websites' do
      expect(Bookmarker.all).to eq(
        ["http://www.google.com",
          "http://www.youtube.com",
          "http://www.facebook.com"]
        )
    end
  end
end
