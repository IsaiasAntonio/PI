class CampusLocation < ApplicationRecord
	validates :name, uniqueness: true, presence: true
end
