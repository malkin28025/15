class Team < ActiveRecord::Base
	belongs_to :city
	has_one :coach
	validates :name, uniqueness: true 
	has_many :home_game, class_name: "Game", foreign_key: :home_team_id
	has_many :away_game, class_name: "Game", foreign_key: :away_team_id
end