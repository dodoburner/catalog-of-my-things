require './item'
require 'json'

class Book < Item
  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state

    move_to_archive
    book = {
      id: @id,
      archived: @archived,
      cover_state: @cover_state,
      publish_date: @publish_date,
      author_id: @author ? @author.id : nil
    }
    File.write("books.json", book.to_json, mode: "a")
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end