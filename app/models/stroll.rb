class Stroll < ApplicationRecord
	belongs_to :city
	belongs_to :dogsitter
	has_and_belongs_to_many :dogs
end
