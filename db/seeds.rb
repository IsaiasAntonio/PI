# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
campus_locations = CampusLocation.create(
	[
		{name: "Colima"},
		{name: "Manzanillo"}
	]
)

dependences = Dependence.create(
	[
		{
			name: "Facultad de Telemática",
			campus_location_id: 1
		},
		{
			name: "Facultad de gastronomía",
			campus_location_id: 2
		}
	]
)

user_roles = UserRole.create(
	[
		{
			name: "Admin"
		},
		{
			name: "Student"
		}
	]
)

ticket_states = TicketStates.create(
	[
		{
			name: "Active"
		},
		{
			name: "Cancelled"
		}
	]
)

movement_tags = MovementTag.create(
	[
		{
			name: "Response"
		},
		{
			name: "Cancelled"
		}
	]
)