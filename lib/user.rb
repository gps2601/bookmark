require 'pg'
require './lib/database_connection'
require 'bcrypt'

class User
  include BCrypt
  attr_reader :id, :username, :password, :name

  def initialize(id, username, password, name)
    @id, @username, @password, @name = id, username, password, name
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    users = result.map{|user| User.new(user['id'], user['username'], user['password'], user['name'])}
  end

  def self.create(username, password, name)
    encrypted_password = Password.create(password)
    DatabaseConnection.query("INSERT INTO users (username, password, name) VALUES ('#{username}', '#{encrypted_password}', '#{name}') RETURNING *")
  end
end
