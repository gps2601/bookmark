class Bookmark
  attr_reader :name, :url

  def initialize(name, url)
    @name, @url = name, url
  end
end
