require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house.rb'
require 'pry'

class HouseTest < Minitest::Test
def test_it_exists
  house = House.new("$400000", "123 sugar lane")
  assert_instance_of House, house
end

def test_it_has_a_price
  house = House.new("$400000", "123 sugar lane")
  assert_equal 400000, house.price
end

def test_it_has_address
  house = House.new("$400000", "123 sugar lane")
  assert_equal "123 sugar lane", house.address
end

def test_it_has_rooms
  house = House.new("$400000", "123 sugar lane")
  assert_equal [], house.rooms
end

def test_it_can_add_rooms
  house = House.new("$400000", "123 sugar lane")
  assert_equal [], house.rooms

  room_1 = Room.new(:bedroom, 10, '13')
  room_2 = Room.new(:bedroom, 11, '15')

  house.add_room(room_1)
  house.add_room (room_2)
  assert_equal [room_1, room_2], house.rooms
end

def test_its_below_market_average
  house = House.new("$400000", "123 sugar lane")
  assert_equal false, house.above_market_average?
end

def test_its_above_market_average
  house = House.new("$600000", "123 sugar lane")
  assert_equal true, house.above_market_average?
end

def test_it_has_categorized_rooms
  house = House.new("$400000", "123 sugar lane")

  room_1 = Room.new(:bedroom, 10, '13')
  room_2 = Room.new(:bedroom, 11, '15')
  room_3 = Room.new(:living_room, 25, '15')
  room_4 = Room.new(:basement, 30, '41')

  house.add_room(room_1)
  house.add_room(room_2)
  house.add_room(room_3)
  house.add_room(room_4)

  assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
  assert_equal [room_4], house.rooms_from_category(:basement)
end

def test_it_has_area
  house = House.new("$400000", "123 sugar lane")

  room_1 = Room.new(:bedroom, 10, '13')
  room_2 = Room.new(:bedroom, 11, '15')
  room_3 = Room.new(:living_room, 25, '15')
  room_4 = Room.new(:basement, 30, '41')

  house.add_room(room_1)
  house.add_room(room_2)
  house.add_room(room_3)
  house.add_room(room_4)

  assert_equal 1900, house.area
end

def test_it_has_details
  house = House.new("$400000", "123 sugar lane")

  assert_equal [400000, "123 sugar lane"], house.details.values
  assert_equal ["price", "address"], house.details.keys
end

def test_it_has_price_per_square_foot
  house = House.new("$400000", "123 sugar lane")

  room_1 = Room.new(:bedroom, 10, '13')
  room_2 = Room.new(:bedroom, 11, '15')
  room_3 = Room.new(:living_room, 25, '15')
  room_4 = Room.new(:basement, 30, '41')

  house.add_room(room_1)
  house.add_room(room_2)
  house.add_room(room_3)
  house.add_room(room_4)
  house.area

  assert_equal 210.53, house.price_per_square_foot
end

def test_it_can_sort_rooms_by_area
  house = House.new("$400000", "123 sugar lane")

  room_1 = Room.new(:bedroom, 10, '13')
  room_2 = Room.new(:bedroom, 11, '15')
  room_3 = Room.new(:living_room, 25, '15')
  room_4 = Room.new(:basement, 30, '41')

  house.add_room(room_1)
  house.add_room(room_2)
  house.add_room(room_3)
  house.add_room(room_4)
  house.area
  house.rooms_sorted_by_area

  assert_equal [room_4, room_3, room_2, room_1], house.rooms
end
end
