class Valera
	attr_accessor :health, :mana, :happiens, :fatigue, :money

	def initialize
		@money = 0
	end

	def go_work
		@money = @money + 500
		@fatigue = @fatigue + 30
		@mana = @mana - 15
	end

	def rest
		@fatigue = @fatigue - 15
		@mana = @mana - 10
	end

	def drink_with_marginals
		@mana = @mana + 25
		@happiens = @happiens + 3
		@money = @money - 1000
	end

	def sing
		income

		if @mana >= 50
			income = 50 + rand 201
			@money = @money + income
		income = 0 else
		end
		@mana = @mana - 15

		income
	end

	def see_serial
		@happiens = @happiens + 2
		@fatigue = @fatigue - 20
		@mana = @mana - 15
	end

	def sleep
		@happiens = @happiens + 1
		@fatigue = @fatigue - 40
		@mana = @mana - 30
	end
end
