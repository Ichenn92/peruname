require "test_helper"

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  @@base_valid_location = Location.new(city: "Lausanne", address: "Boulevard de Grancy 42")
                                
  test "presence of city" do
    test_location = @@base_valid_location
    test_location.city = ""
    assert_not test_location.valid?, test_location.errors.full_messages.inspect
  end

  test "presence of address" do
    test_location = @@base_valid_location
    test_location.address = ""
    assert_not test_location.valid?, test_location.errors.full_messages.inspect
  end
end
