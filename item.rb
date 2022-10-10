class Item
  attr_accessor :publish_date, :archived, :genre, :author
  attr_reader :id

  def initialize()
    @id = Random.rand(1..1000)
  end

  def add_genre(genre)
    genre.items << self unless genre.items.include? self
    @genre = genre
  end

  def add_author(author)
    author.items << self unless author.items.include? self
    @author = author
  end

  def add_source(source)
    source.items << self unless source.items.include? self
    @source = source
  end

  def add_source(label)
    label.items << self unless label.items.include? self
    @label = label
  end
end