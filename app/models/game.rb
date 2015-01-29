class Game < ActiveRecord::Base
	has_many :teams
	belongs_to :home_games, class_name: "Game" 
	belongs_to :away_games, class_name: "Game"
end
