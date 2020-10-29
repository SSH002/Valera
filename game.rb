require_relative 'valera'

class Game
	attr_reader :valera
	
	def initialize
		@valera = Valera.new
	end
end
