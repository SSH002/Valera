class Valera
	attr_accessor :health, :mana, :happiens, :fatigue, :money

	def initialize
		@money = 0
	end

	def go_work
		@money = @money + 1000
		@fatigue = @fatigue + 30
		@mana = @mana - 15
	end

	def rest
		@fatigue = @fatigue - 15
		@mana = @mana - 10
	end

	def drink_with_marginals
		if @money >= 1500
			@mana = @mana + 25
			@happiens = @happiens + 3
			@money = @money - 1500
		else
			puts 'У Валеры недостаточно средств для того, чтобы выпить с маргиналами.'
		end
	end

	def sing
		income = 0

		if @mana >= 30
			income = 50 + rand(401)
			@money = @money + income
		else
			income = 0
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
		@fatigue = @fatigue - 50
		@mana = @mana - 30
	end

	def blackjack
		loop do
			system 'clear'
			card_valera = 0
			card_enemy = 0
			loop do
				card_valera = card_valera + 2 + rand(10)
				card_enemy = card_enemy + 2 + rand(10)
				print 'Ваши карты: ', card_valera
				print 'Карты противника: ', card_enemy
				system 'clear'
			end
		end
	end
end
