class Label
  attr_accessor :items
  attr_reader :id, :title, :color

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
  end

  def add_item(item)
    item.label = self
    items << item
end
