require "test_helper"

class VetTest < ActiveSupport::TestCase
  def setup
    @vet = Vet.new(
      first_name: "Andrea",
      last_name: "Martinez",
      email: "andrea_test@example.com",
      phone: "222222222",
      specialization: "General Practice"
    )
  end

  test "should save valid vet" do
    assert @vet.valid?
  end

  test "should require first_name" do
    @vet.first_name = nil
    assert_not @vet.valid?
    assert_includes @vet.errors[:first_name], "can't be blank"
  end

  test "should require last_name" do
    @vet.last_name = nil
    assert_not @vet.valid?
    assert_includes @vet.errors[:last_name], "can't be blank"
  end

  test "should require email" do
    @vet.email = nil
    assert_not @vet.valid?
    assert_includes @vet.errors[:email], "can't be blank"
  end

  test "should require unique email" do
    @vet.save!
    duplicate = @vet.dup
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:email], "has already been taken"
  end

  test "should require valid email format" do
    @vet.email = "invalid_email"
    assert_not @vet.valid?
    assert_includes @vet.errors[:email], "is invalid"
  end

  test "should require specialization" do
    @vet.specialization = nil
    assert_not @vet.valid?
    assert_includes @vet.errors[:specialization], "can't be blank"
  end
end
