class Bookmarker
  attr_reader :bookmarks

  def initialize(bookmarks = [])
    @bookmarks = bookmarks
  end

  def self.all
    ["http://www.google.com",
    "http://www.youtube.com",
    "http://www.facebook.com"]
  end
end
