require 'pg'

def clear_down_tables
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE TABLE bookmarks, comments, bookmark_tags, tags, users;")

end

def populate_bookmarks
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (id, url, title) VALUES (1, 'http://www.google.com', 'Google');")
  connection.exec("INSERT INTO bookmarks (id, url, title) VALUES (2, 'http://www.youtube.com', 'Youtube');")
  connection.exec("INSERT INTO bookmarks (id, url, title) VALUES (3, 'http://www.destroyallsoftware.com', 'Destroy software');")
end


def populate_comments
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO comments (id, text, bookmark_id) VALUES (1, 'This is the first comment about google?!', 1);")
  connection.exec("INSERT INTO comments (id, text, bookmark_id) VALUES (2, 'Another google comment', 1);")
  connection.exec("INSERT INTO comments (id, text, bookmark_id) VALUES (3, 'This is the first comment about youtube?!', 2);")
  connection.exec("INSERT INTO comments (id, text, bookmark_id) VALUES (4, 'This is the first comment about software?!', 3);")
  connection.exec("INSERT INTO comments (id, text, bookmark_id) VALUES (5, 'This is the second comment about software?!', 3);")
  connection.exec("INSERT INTO comments (id, text, bookmark_id) VALUES (6, 'This is the third comment about software?!', 3);")
end

def populate_tags
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO tags (id, content) VALUES (1, 'informative');")
  connection.exec("INSERT INTO tags (id, content) VALUES (2, 'coding');")
  connection.exec("INSERT INTO tags (id, content) VALUES (3, 'fun');")
end

def populate_bookmark_tags
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmark_tags (id, bookmark_id, tag_id) VALUES ('1', '1', '2');")
  connection.exec("INSERT INTO bookmark_tags (id, bookmark_id, tag_id) VALUES ('2', '2', '2');")
  connection.exec("INSERT INTO bookmark_tags (id, bookmark_id, tag_id) VALUES ('3', '1', '2');")
end
