require 'pg'
require './lib/database_connection'

class Tag
  def self.all
    result = DatabaseConnection.query("SELECT * FROM tags;")
    tags = result.map { |tag|
      tag['content']
    }
  end
end
