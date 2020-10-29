class Valera
	attr_accessor :health, :mana, :happiens, :fatigue, :money

	def initialize
	end

	def go_work
		@money = @money + 300
		@fatigue = @fatigue + 30
		@mana = @mana - 15
	end

	def rest
		@fatigue = @fatigue - 15
		@mana = @mana - 10
	end
end
