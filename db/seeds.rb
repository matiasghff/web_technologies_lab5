# This file should ensure the existence of records required to run the application in every environment
# (production, development, test). The code here should be idempotent so that it can be executed at
# any point in every environment. The data can then be loaded with the bin/rails db:seed command
# (or created alongside the database with db:setup).

Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Owner.destroy_all
Vet.destroy_all

# Owners
owner1 = Owner.create!(
  first_name: "Matias",
  last_name: "Garcia",
  email: "matias@example.com",
  phone: "123456789",
  address: "123 Main Street, Santiago"
)

owner2 = Owner.create!(
  first_name: "Cristiano",
  last_name: "Ronaldo",
  email: "cristiano@example.com",
  phone: "987654321",
  address: "456 Oak Avenue, Valparaiso"
)

owner3 = Owner.create!(
  first_name: "Vinicius",
  last_name: "Junior",
  email: "vinicius@example.com",
  phone: "555666777",
  address: "789 Pine Road, Concepcion"
)

# Pets
pet1 = owner1.pets.create!(
  name: "Rocky",
  species: "dog",
  breed: "Labrador",
  date_of_birth: Date.new(2020, 5, 10),
  weight: 28.5
)

pet2 = owner1.pets.create!(
  name: "Milo",
  species: "cat",
  breed: "Siamese",
  date_of_birth: Date.new(2021, 8, 15),
  weight: 4.2
)

pet3 = owner2.pets.create!(
  name: "Luna",
  species: "dog",
  breed: "Beagle",
  date_of_birth: Date.new(2019, 3, 20),
  weight: 12.8
)

pet4 = owner2.pets.create!(
  name: "Coco",
  species: "rabbit",
  breed: "Mini Lop",
  date_of_birth: Date.new(2022, 1, 5),
  weight: 2.3
)

pet5 = owner3.pets.create!(
  name: "Nala",
  species: "cat",
  breed: "Persian",
  date_of_birth: Date.new(2018, 11, 30),
  weight: 5.0
)

# Vets
vet1 = Vet.create!(
  first_name: "Andrea",
  last_name: "Martinez",
  email: "andrea.vet@example.com",
  phone: "111222333",
  specialization: "General Practice"
)

vet2 = Vet.create!(
  first_name: "Javier",
  last_name: "Rojas",
  email: "javier.vet@example.com",
  phone: "444555666",
  specialization: "Surgery"
)

# Appointments
appointment1 = Appointment.create!(
  pet: pet1,
  vet: vet1,
  date: DateTime.new(2026, 4, 15, 10, 0, 0),
  reason: "Annual checkup",
  status: :scheduled
)

appointment2 = Appointment.create!(
  pet: pet2,
  vet: vet1,
  date: DateTime.new(2026, 4, 16, 11, 30, 0),
  reason: "Skin irritation",
  status: :in_progress
)

appointment3 = Appointment.create!(
  pet: pet3,
  vet: vet2,
  date: DateTime.new(2026, 5, 17, 9, 0, 0),
  reason: "Dental cleaning",
  status: :completed
)

appointment4 = Appointment.create!(
  pet: pet4,
  vet: vet1,
  date: DateTime.new(2026, 5, 18, 14, 0, 0),
  reason: "Digestive issues",
  status: :completed
)

appointment5 = Appointment.create!(
  pet: pet5,
  vet: vet2,
  date: DateTime.new(2026, 5, 19, 16, 0, 0),
  reason: "Vaccination",
  status: :cancelled
)

# Treatments
Treatment.create!(
  appointment: appointment2,
  name: "Skin cleaning",
  medication: "Antibacterial shampoo",
  dosage: "Twice weekly",
  notes: "Apply gently and monitor irritation.",
  administered_at: DateTime.new(2026, 4, 16, 12, 0, 0)
)

Treatment.create!(
  appointment: appointment2,
  name: "Anti-inflammatory treatment",
  medication: "Prednisone",
  dosage: "5 mg daily",
  notes: "Use for 5 days.",
  administered_at: DateTime.new(2026, 4, 16, 12, 10, 0)
)

Treatment.create!(
  appointment: appointment3,
  name: "Teeth cleaning",
  medication: "Dental rinse",
  dosage: "Once after procedure",
  notes: "Post-cleaning treatment.",
  administered_at: DateTime.new(2026, 4, 17, 10, 0, 0)
)

Treatment.create!(
  appointment: appointment4,
  name: "Digestive support",
  medication: "Probiotic paste",
  dosage: "Once daily",
  notes: "Administer after meals.",
  administered_at: DateTime.new(2026, 4, 18, 14, 30, 0)
)

Treatment.create!(
  appointment: appointment3,
  name: "Pain management",
  medication: "Meloxicam",
  dosage: "Once daily for 3 days",
  notes: "Monitor for side effects.",
  administered_at: DateTime.new(2026, 4, 17, 10, 15, 0)
)

puts "Seed data created successfully!"
