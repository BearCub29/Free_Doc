# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#array contenant les id de city
city_id = []
5.times do
  city = City.create!(name: Faker::Address.city)
  puts "Création d'une ville"
  city_id << city.id #inserer id dans array de id
end
#array contenant les id de doctor
doctor_id = []
20.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::IDNumber.valid, city_id: city_id.sample )
  puts "Création d'un docteur"
  doctor_id << doctor.id #inserer id dans array de id
end
#array contenant les id de patient
patient_id = []
20.times do
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: city_id.sample)
  puts "Création d'un patient"
  patient_id << patient.id #inserer id dans array de id
end
#array contenant les id de specialty
specialty_id =[]
5.times do
  specialty = Specialty.create!(name: Faker::Job.key_skill)
  puts "Création d'une spécialité"
  specialty_id << specialty.id #inserer id dans array de id
end
5.times do
  appointment = Appointment.create!(date: Faker::Date.forward(days: 60), doctor_id: doctor_id.sample, patient_id: patient_id.sample, city_id: city_id.sample)
  puts "Création d'un rdv"
end
5.times do
  connect = Connect.create!(specialty_id: specialty_id.sample,doctor_id: doctor_id.sample )
  puts "Création d'une connection"
end











