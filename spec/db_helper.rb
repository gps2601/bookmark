require 'pg'

def clear_down_table(database_name, table_name)
  connection = PG.connect(dbname: database_name)
  connection.exec("TRUNCATE TABLE #{table_name};")
end

def populate_bookmarks(database_name, table_name)
  connection = PG.connect(dbname: database_name)
  connection.exec("INSERT INTO #{table_name} (url, title) VALUES ('http://www.google.com', 'Google');")
  connection.exec("INSERT INTO #{table_name} (url, title) VALUES ('http://www.youtube.com', 'Youtube');")
  connection.exec("INSERT INTO #{table_name} (url, title) VALUES ('http://www.destroyallsoftware.com', 'Destroy software');")
end
