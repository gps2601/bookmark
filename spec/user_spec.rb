require 'user'

describe User do
  it 'can add a user to the database' do
    User.create('test_username', 'test123', 'test_name')

    users = User.all

    expect(users.find{|user| user.username == 'test_username'}).to_not be(nil)
  end
end
