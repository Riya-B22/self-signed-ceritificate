# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
student= Student.create(
	first_name: "Riya",
	last_name: "Bajpai",
	email: "Riya.Bajpai@gmail.com",
	date_of_birth: "25 july 1996",
	address: "Earth"
	)

20.times do |i|
	puts "Creating student #{i+1}"
	Student.create(
	first_name: "FName #{i+1}",
	last_name: "LName #{i+1}",
	email: "student#{i+1}@bootcamp.com",
	date_of_birth: "#{i+1} july 199#{i+1}",
	address: "City #{i+1}"
	)
end