require "test_helper"

class PerformanceTest < ActiveSupport::TestCase
  @@base_valid_character = Character.new(name: "Pikachu", category: "Anime")
  
  @@base_valid_actor = User.new(nickname: "Leo",
                                first_name: "Leonardo",
                                last_name: "di Caprio",
                                email: "leonardodicaprio@gmail.com",
                                actor: true,
                                password: "inglorious_bastard")

  @@base_valid_location = Location.new(city: "Pully", address: "Chemin des Bains 4")

  @@base_valid_performance = Performance.new(description: "A superb performance involving Pikachu at Pully outside swimming pool",
                                            character: @@base_valid_character,
                                            location: @@base_valid_location,
                                            user: @@base_valid_actor,
                                            price_per_hour: "32")

  test "is rejected when it has no character" do
    test_performance = @@base_valid_performance
    test_performance.character = nil
    assert_not test_performance.valid?, test_performance.errors.full_messages.inspect
  end

  test "is rejected when it has no location" do
    test_performance = @@base_valid_performance
    test_performance.location = nil
    assert_not test_performance.valid?, test_performance.errors.full_messages.inspect
  end

  test "is rejected when it has no user" do
    test_performance = @@base_valid_performance
    test_performance.user = nil
    assert_not test_performance.valid?, test_performance.errors.full_messages.inspect
  end
end
