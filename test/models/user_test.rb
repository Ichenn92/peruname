require "test_helper"

class UserTest < ActiveSupport::TestCase
  @@base_valid_actor = User.new(nickname: "titi",
                                first_name: "toto",
                                last_name: "tete",
                                email: "titi@tete.ch",
                                actor: true,
                                password: "12341234")

  test "User.actor? default is false" do
    test_user = User.new
    assert_not test_user.actor?, test_user.errors.full_messages.inspect
  end

  test "presence of actor, nickname, first_name, last_name, email, password" do
    test_user = @@base_valid_actor
    test_user.actor = false
    assert test_user.valid?, test_user.errors.full_messages.inspect
  end

  test "validates start availibility time is earlier than end availibility time" do
    test_user = @@base_valid_actor
    test_user.availibility_start_time = Tod::TimeOfDay.new 8, 15
    test_user.availibility_end_time = Tod::TimeOfDay.new 16, 45
    assert test_user.valid?, test_user.errors.full_messages.inspect
  end

  test "reject when start availibility time is later to end availibility time" do
    test_user = @@base_valid_actor
    test_user.availibility_start_time = Tod::TimeOfDay.new 18, 15
    test_user.availibility_end_time = Tod::TimeOfDay.new 16, 45
    assert_not test_user.valid?, test_user.errors.full_messages.inspect
  end

  test "reject when start availibility time is equal to end availibility time" do
    test_user = @@base_valid_actor
    test_user.availibility_start_time = Tod::TimeOfDay.new 16, 45
    test_user.availibility_end_time = Tod::TimeOfDay.new 16, 45
    assert_not test_user.valid?, test_user.errors.full_messages.inspect
  end
end
