require 'pg'

class Bookmarker
  attr_reader :bookmarks

  def initialize(bookmarks = [])
    @bookmarks = bookmarks
  end

  def self.all
    if ENV['RACK_ENV'] == 'development'
      database = 'bookmark_manager'
    elsif ENV['RACK_ENV'] == 'test'
      database = 'bookmark_manager_test'
    else
      raise 'Not sure what environment you are in!'
    end

    connection = PG.connect(dbname: database)
    result = connection.exec("SELECT * FROM bookmarks;")

    result.map{|bookmark| bookmark['url']}
  end
end
