class User < ActiveRecord::Base
  # Include default devise modules.
  belongs_to :dependence
  belongs_to :user_role
  has_many :responsable_tickets, :class_name => "Ticket", :foreign_key => "responsable_id"
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  def as_json(options={})
		super(:include => [:dependence, :user_role])
  end
end