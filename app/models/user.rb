class User < ActiveRecord::Base
  # Include default devise modules.
  belongs_to :dependence
  belongs_to :user_role

  # Agrega una segunda llave foránrea para poder tener un responsable del ticket.
  has_many :responsable_tickets, :class_name => "Ticket", :foreign_key => "responsable_id"

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  # Se hace override a una función de sistema para agregar parámetros adicionales a las respuestas de usuario,
  # en este caso se regresa adicional una dependencia y un rol de usuario.
  def as_json(options={})
		super(:include => [:dependence, :user_role])
  end
end