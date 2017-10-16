class User < ActiveRecord::Base
  # Include default devise modules.
  belongs_to :dependence
  belongs_to :user_role
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  def as_json(options={})
		super(:include => [:dependence, :user_role])
  end
end