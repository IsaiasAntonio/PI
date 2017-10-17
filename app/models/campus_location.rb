class CampusLocation < ApplicationRecord
	validates :name, uniqueness: true
end
