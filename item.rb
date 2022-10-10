class Item
  attr_accessor :publish_date, :genre, :author, :label
  attr_reader :id, :archived

  def initialize()
    @id = Random.rand(1..1000)
    @publish_date = Data.parse(publish_date)
    @archived = false
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

  def set_label(label)
    label.items << self unless label.items.include? self
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def can_be_archived?
    true if (Date.today.to_time.year - @publish_date.to_time.year) > 10
  end
end