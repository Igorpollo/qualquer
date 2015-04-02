class Team < ActiveRecord::Base
	has_many :users
	belongs_to :game
	validates :name, :presence => { :message => " vamos ver se vai" }

	extend FriendlyId
  friendly_id :name, use: :slugged
end
