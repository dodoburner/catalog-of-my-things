class Item
  attr_accessor :publish_date, :genre, :author, :label
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
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

  def add_label(label)
    label.items << self unless label.items.include? self
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    true if (DateTime.now - @publish_date).to_i / 365 > 10
  end
end
