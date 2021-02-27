require "test_helper"

class UserTest < ActiveSupport::TestCase
  @@base_valid_actor = User.new(nickname: "titi",
                                first_name: "toto",
                                last_name: "tete",
                                email: "titi@tete.ch",
                                actor: true,
                                password: "12341234")

  test "User.actor? default is false" do
    u = User.new
    assert_not u.actor?, u.errors.full_messages.inspect
  end

  test "presence of actor, nickname, first_name, last_name, email, password" do
    u = @@base_valid_actor
    u.actor = false
    assert u.valid?, u.errors.full_messages.inspect
  end

  test "validates start availability time is earlier than end availability time" do
    u = @@base_valid_actor
    u.availability_start_time = Tod::TimeOfDay.new 8, 15
    u.availability_end_time = Tod::TimeOfDay.new 16, 45
    assert u.valid?, u.errors.full_messages.inspect
  end

  test "reject when start availability time is later to end availability time" do
    u = @@base_valid_actor
    u.availability_start_time = Tod::TimeOfDay.new 18, 15
    u.availability_end_time = Tod::TimeOfDay.new 16, 45
    assert_not u.valid?, u.errors.full_messages.inspect
  end

  test "reject when start availability time is equal to end availability time" do
    u = @@base_valid_actor
    u.availability_start_time = Tod::TimeOfDay.new 16, 45
    u.availability_end_time = Tod::TimeOfDay.new 16, 45
    assert_not u.valid?, u.errors.full_messages.inspect
  end
end
