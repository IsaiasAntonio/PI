class MovementTag < ApplicationRecord
	validates :name, presence: true, uniqueness: true
end
