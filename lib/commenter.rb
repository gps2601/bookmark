require 'pg'
require './lib/database_connection'

class Commenter
  def self.all
    result = DatabaseConnection.query("SELECT * FROM comments;")
    bookmarks = result.map { |comment|
      comment['text']
    }
  end

  def self.create(bookmark_id, text)
    DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES ('#{text}', '#{bookmark_id}')")
  end
end
