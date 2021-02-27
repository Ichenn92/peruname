require "test_helper"

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  @@base_valid_location = Location.new(name: "Starbucks", address: "Place de la Gare 2, 1001 Lausanne")
                                
  test "rejects absence of name" do
    test_location = @@base_valid_location
    test_location.name = ""
    assert_not test_location.valid?, test_location.errors.full_messages.inspect
  end
end
