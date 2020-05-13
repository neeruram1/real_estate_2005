class House
  attr_reader :price,
              :address,
              :rooms,
              :details

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
    @details = {"price" => @price, "address" => @address}
  end

  def add_room(room_param)
    @rooms << room_param
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category_param)
    @rooms.find_all do |room|
      room.category == category_param
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end
end
