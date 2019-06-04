require 'database_connection'

describe DatabaseConnection do
  it '#setup saves a database connection as class instance' do
    expect(PG).to receive(:connect).with(dbname: 'test_name')

    DatabaseConnection.setup('test_name')
  end

  it 'can return an databse connection' do
    connection = DatabaseConnection.setup('bookmark_manager_test')

    expect(DatabaseConnection.connection).to eq(connection)
  end

  it '#query executes on the class instance database connection' do
    connection = DatabaseConnection.setup('bookmark_manager_test')

    expect(connection).to receive(:exec).with('select * from bookmarks')

    DatabaseConnection.query('select * from bookmarks')
  end
end
