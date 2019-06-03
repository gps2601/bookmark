require 'pg'
require './lib/bookmark'

class Bookmarker
  attr_reader :bookmarks

  def initialize(bookmarks = [], bookmark_class = Bookmark)
    @bookmarks = bookmarks
    @bookmark_class = bookmark_class
  end

  def self.all
    connection = PG.connect(dbname: get_database())
    result = connection.exec("SELECT * FROM bookmarks;")

    result.map{ |bookmark|
      Bookmark.new(bookmark['title'],bookmark['url'])
    }
  end

  def self.create(title, url)
    connection = PG.connect(dbname: get_database())
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')")
  end

  private

  def self.get_database
    if ENV['RACK_ENV'] == 'development'
      return 'bookmark_manager'
    elsif ENV['RACK_ENV'] == 'test'
      return 'bookmark_manager_test'
    else
      raise 'Not sure what environment you are in!'
    end
  end
end
