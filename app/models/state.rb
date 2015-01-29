class State < ActiveRecord::Base
	has_many :teams, through: :cities
end