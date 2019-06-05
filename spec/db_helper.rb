require 'pg'

def clear_down_tables
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE TABLE bookmarks, comments;")
end

def populate_bookmarks
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (id, url, title) VALUES (1, 'http://www.google.com', 'Google');")
  connection.exec("INSERT INTO bookmarks (id, url, title) VALUES (2, 'http://www.youtube.com', 'Youtube');")
  connection.exec("INSERT INTO bookmarks (id, url, title) VALUES (3, 'http://www.destroyallsoftware.com', 'Destroy software');")
end


def populate_comments
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO comments (text, bookmark_id) VALUES ('This is the first comment about google?!', 1);")
  connection.exec("INSERT INTO comments (text, bookmark_id) VALUES ('This is the first comment about youtube?!', 2);")
  connection.exec("INSERT INTO comments (text, bookmark_id) VALUES ('This is the first comment about software?!', 3);")
end
