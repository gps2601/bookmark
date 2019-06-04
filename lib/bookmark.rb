class Bookmark
  attr_reader :id, :name, :url

  def initialize(id, name, url)
    @id, @name, @url = id, name, url
  end
end
