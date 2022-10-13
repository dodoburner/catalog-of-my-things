require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :id, :archived, :genre, :author, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def add_genre(genre)
    genre.add_items << self unless genre.items.include? self
    @genre = genre
  end

  def add_author(author)
    author.add_items << self unless author.items.include? self
    @author = author
  end

  def add_label(label)
    label.add_items << self unless label.items.include? self
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
