require 'pg'

class Bookmarker
  attr_reader :bookmarks

  def initialize(bookmarks = [])
    @bookmarks = bookmarks
  end

  def self.all
    connection = PG.connect(dbname: get_database())
    result = connection.exec("SELECT * FROM bookmarks;")

    result.map{|bookmark| bookmark['url']}
  end

  def self.create(url)
    connection = PG.connect(dbname: get_database())
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
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
