require "test_helper"

class TreatmentTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.create!(
      first_name: "Owner",
      last_name: "Treatment",
      email: "owner_treatment_test@example.com",
      phone: "555555555",
      address: "Address"
    )

    @pet = Pet.create!(
      name: "Luna",
      species: "cat",
      breed: "Siamese",
      date_of_birth: Date.current - 2.years,
      weight: 5,
      owner: @owner
    )

    @vet = Vet.create!(
      first_name: "Vet",
      last_name: "Treatment",
      email: "vet_treatment_test@example.com",
      phone: "666666666",
      specialization: "Dermatology"
    )

    @appointment = Appointment.create!(
      date: 1.day.ago,
      reason: "Skin issue",
      pet: @pet,
      vet: @vet,
      status: :completed
    )

    @treatment = Treatment.new(
      appointment: @appointment,
      name: "Skin cleaning",
      medication: "Shampoo",
      dosage: "Twice weekly",
      notes: "Apply carefully",
      administered_at: Time.current
    )
  end

  test "should save valid treatment" do
    assert @treatment.valid?
  end

  test "should require name" do
    @treatment.name = nil
    assert_not @treatment.valid?
    assert_includes @treatment.errors[:name], "can't be blank"
  end

  test "should require administered_at" do
    @treatment.administered_at = nil
    assert_not @treatment.valid?
    assert_includes @treatment.errors[:administered_at], "can't be blank"
  end

  test "should require appointment" do
    @treatment.appointment = nil
    assert_not @treatment.valid?
    assert_includes @treatment.errors[:appointment], "can't be blank"
  end
end
