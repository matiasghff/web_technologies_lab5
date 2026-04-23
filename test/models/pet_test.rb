require "test_helper"

class PetTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.create!(
      first_name: "Owner",
      last_name: "One",
      email: "owner_pet_test@example.com",
      phone: "111111111",
      address: "Address"
    )

    @pet = Pet.new(
      name: "rocky",
      species: "dog",
      breed: "Labrador",
      date_of_birth: Date.current - 1.year,
      weight: 10.5,
      owner: @owner
    )
  end

  test "should save valid pet" do
    assert @pet.valid?
  end

  test "should require name" do
    @pet.name = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:name], "can't be blank"
  end

  test "should require species" do
    @pet.species = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:species], "can't be blank"
  end

  test "should restrict species values" do
    @pet.species = "horse"
    assert_not @pet.valid?
    assert_includes @pet.errors[:species], "is not included in the list"
  end

  test "should require date_of_birth" do
    @pet.date_of_birth = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:date_of_birth], "can't be blank"
  end

  test "date_of_birth cannot be in the future" do
    @pet.date_of_birth = Date.current + 1.day
    assert_not @pet.valid?
    assert_includes @pet.errors[:date_of_birth], "cannot be in the future"
  end

  test "should require weight" do
    @pet.weight = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:weight], "can't be blank"
  end

  test "weight should be greater than zero" do
    @pet.weight = 0
    assert_not @pet.valid?
    assert_includes @pet.errors[:weight], "must be greater than 0"
  end

  test "should require owner" do
    @pet.owner = nil
    assert_not @pet.valid?
    assert_includes @pet.errors[:owner], "can't be blank"
  end
end
