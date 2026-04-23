require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.new(
      first_name: "Matias",
      last_name: "Garcia",
      email: "matias_test@example.com",
      phone: "123456789",
      address: "Some address"
    )
  end

  test "should save valid owner" do
    assert @owner.valid?
  end

  test "should require first_name" do
    @owner.first_name = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:first_name], "can't be blank"
  end

  test "should require last_name" do
    @owner.last_name = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:last_name], "can't be blank"
  end

  test "should require email" do
    @owner.email = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:email], "can't be blank"
  end

  test "should require unique email" do
    @owner.save!
    duplicate = @owner.dup
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:email], "has already been taken"
  end

  test "should require valid email format" do
    @owner.email = "invalid_email"
    assert_not @owner.valid?
    assert_includes @owner.errors[:email], "is invalid"
  end

  test "should require phone" do
    @owner.phone = nil
    assert_not @owner.valid?
    assert_includes @owner.errors[:phone], "can't be blank"
  end
end
