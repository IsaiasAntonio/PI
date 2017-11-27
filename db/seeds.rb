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
		{ name: "Coquimatlán"},
		{ name: "Villa de Álvarez" },
		{ name: "Tecomán" },
		{ name: "Cuauhtémoc" }
	]
)

dependences = Dependence.create(
	[
		{
			name: "Facultad de Telemática",
			campus_location_id: 1
		},
		{
			name: "Facultad de Medicina",
			campus_location_id: 1
		},
		{
			name: "Facultad de Psicología",
			campus_location_id: 1
		},
		{
			name: "Facultad de gastronomía",
			campus_location_id: 2
		},
		{
			name: "FIME",
			campus_location_id: 3
		},
		{
			name: "Facultad de Economía",
			campus_location_id: 4
		},
		{
			name: "Facultad de Veterinaria",
			campus_location_id: 5
		},
		{
			name: "Facultad de Turismo",
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
			name: "Responsable"
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
			name: "Cancelado"
		}
	]
)

movement_tags = MovementTag.create(
	[
		{
			name: "Respuesta"
		},
		{
			name: "Cancelado"
		}
	]
)