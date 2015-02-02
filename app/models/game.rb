class Game < ActiveRecord::Base
	has_many :teams
	belongs_to :home_games, class_name: "Team" 
	belongs_to :away_games, class_name: "Team"
end
