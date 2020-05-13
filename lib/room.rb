class Room
  attr_reader :category

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width.to_i
  end

  def area
    @length * @width
  end

  def is_painted?
    @paint == true
  end

def paint
  @paint = true
end
end
