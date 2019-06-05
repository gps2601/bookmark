require 'pg'
require './lib/database_connection'

class Tag
  def self.all
    result = DatabaseConnection.query("SELECT * FROM tags;")
    tags = result.map { |tag|
      tag['content']
    }
  end

  def self.create(content)
    DatabaseConnection.query("INSERT INTO tags (content) VALUES ('#{content}')") unless Tag.all.include?(content)
    tags =DatabaseConnection.query("SELECT * FROM tags WHERE content = '#{content}'");
    tags.first['id']
  end
end
