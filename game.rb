require './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at_date

  def initialize(multiplayer, last_played_at_date, publish_date)
    super(publish_date)

    @multiplayer = multiplayer
    @last_played_at_date = Date.parse(last_played_at_date)
    move_to_archive
  end

  def can_be_archived?
    super && (Date.today.to_time.year - @last_played_at_date.year) > 2
  end
end
