require 'pg'
require './lib/database_connection'

class BookmarkTag
  def self.create(bookmark_id, tag_id)
    result = DatabaseConnection.query("INSERT INTO bookmark_tags (bookmark_id, tag_id) VALUES(#{bookmark_id}, #{tag_id}) RETURNING bookmark_id, tag_id;")
    print result
  end
end
