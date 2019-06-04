require 'pg'

def clear_down_table(database_name, table_name)
  connection = PG.connect(dbname: database_name)
  connection.exec("TRUNCATE TABLE #{table_name};")
end

def populate_bookmarks(database_name, table_name)
  connection = PG.connect(dbname: database_name)
  connection.exec("INSERT INTO #{table_name} (id, url, title) VALUES ('1', 'http://www.google.com', 'Google');")
  connection.exec("INSERT INTO #{table_name} (id, url, title) VALUES ('2', 'http://www.youtube.com', 'Youtube');")
  connection.exec("INSERT INTO #{table_name} (id, url, title) VALUES ('3', 'http://www.destroyallsoftware.com', 'Destroy software');")
end
