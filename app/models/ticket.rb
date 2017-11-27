class Ticket < ApplicationRecord

	# Se indican las relaciones que tendrá el modelo de Ticket
  belongs_to :ticket_state
  belongs_to :user
  # En el caso de una relación manual, se debe indicar la clase a la que pertenece el nombre de la relación.
  belongs_to :responsable, :class_name => "User"


  # Modificación a una función de sistema para añadir más valores a una respuesta.
	def as_json(options={})
	  super(:include => [:user, :responsable, :ticket_state])
	end
end
