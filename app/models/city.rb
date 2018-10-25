class City < ApplicationRecord
	has_many :dogwalkers
	has_many :dogs
	has_many :strolls
end
