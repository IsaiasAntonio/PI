# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
campus_locations = CampusLocation.create(
	[
		{ name: "Colima" },
		{ name: "Manzanillo" },
		{ name: "Coquimatlán" },
		{ name: "Villa de Álvarez" },
		{ name: "Tecomán" },
		{ name: "Cuauhtémoc" }
	]
)

dependences = Dependence.create(
	[
		{
			name: "Biblioteca de Humanidades",
			campus_location_id: 1
		},
		{
			name: "Bibioteca de Ciencias",
			campus_location_id: 1
		},
		{
			name: "Bibioteca de Negocios",
			campus_location_id: 2
		},
		{
			name: "Biblioteca de ciencias exactas",
			campus_location_id: 3
		},
		{
			name: "Bibioteca de Lenguas",
			campus_location_id: 4
		}
	]
)

user_roles = UserRole.create(
	[
		{
			name: "Administrador"
		},
		{
			name: "Bibliotecario"
		},
		{
			name: "Estudiante"
		}
	]
)

ticket_states = TicketState.create(
	[
		{
			name: "Activo"
		},
		{
			name: "Cerrado"
		}
	]
)

movement_tags = MovementTag.create(
	[
		{
			name: "Respuesta"
		},
		{
			name: "Pregunta"
		},
		{
			name: "Cierre"
		}
	]
)