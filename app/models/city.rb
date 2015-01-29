class City < ActiveRecord::Base
	belongs_to :state
	has_many :teams
has_many :home_games, class_name:, foreign_key: "home_team_id"
has_many :away_games, class_name:, foreign_key: "away_team_id"
end