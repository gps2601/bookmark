require 'pg'
require './lib/database_connection'

class Bookmarker
  attr_reader :id, :name, :url

  def initialize(id, name, url)
    @id, @name, @url = id, name, url
  end

  def comments
    result = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id='#{id}';")
    comments = result.map{|comment| comment['text']}
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    bookmarks = result.map { |bookmark|
      Bookmarker.new(bookmark['id'], bookmark['title'], bookmark['url'])
    }
  end

  def self.create(title, url)
    return false unless is_valid_url?(url)

    DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')")
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{id}'")
  end

  private_class_method def self.is_valid_url?(url)
    url =~ URI::regexp
  end
end
