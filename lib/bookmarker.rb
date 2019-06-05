require 'pg'
require './lib/bookmark'
require './lib/database_connection'

class Bookmarker
  attr_reader :bookmarks

  def initialize(bookmarks = [], bookmark_class = Bookmark)
    @bookmarks = bookmarks
    @bookmark_class = bookmark_class
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    bookmarks = result.map { |bookmark|
      Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
    }
  end

  def self.create(title, url)
    return false unless is_valid_url?(url)

    connection = PG.connect(dbname: database_name())
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')")
  end

  def self.delete(id)
    connection = PG.connect(dbname: database_name())
    connection.exec("DELETE FROM bookmarks WHERE id = '#{id}'")
  end

  private_class_method def self.database_name
    return 'bookmark_manager' if ENV['RACK_ENV'] == 'development'

    return 'bookmark_manager_test' if ENV['RACK_ENV'] == 'test'

    raise 'Not sure what environment you are in!'
  end

  private_class_method def self.is_valid_url?(url)
    url =~ URI::regexp
  end
end
