class City < ActiveRecord::Base
	belongs_to :state
	has_many :teams
has_many :home_games
has_many :away_games
end