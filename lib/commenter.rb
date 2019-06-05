require 'pg'
require './lib/database_connection'

class Commenter
  def self.all
    result = DatabaseConnection.query("SELECT * FROM comments;")
    bookmarks = result.map { |comment|
      comment['text']
    }
  end
end
