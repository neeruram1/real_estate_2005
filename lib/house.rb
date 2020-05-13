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
    @house_area = 0
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
    @house_area = @rooms.sum do |room|
      room.area
    end
  end

  def price_per_square_foot
    price_per_square_foot = @price.to_f / @house_area.to_f
    price_per_square_foot.to_f.round(2)
  end

  def rooms_sorted_by_area
    @rooms.reverse! do |room|
      room.area
    end
end
end
