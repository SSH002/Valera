class Blackjack
	attr_reader :card_valera, :card_enemy

	def turn card, player
		buffer = 2 + rand(10)
		if buffer == 11 && card > 10
			buffer = 1
		end
		
		case player
			when true
				card = card + buffer
			when false
				if card < 18
					card = card + buffer
				end
		end
		
		card
	end

	def select_bet
		puts 'Минимальная ставка: 50 руб, максимальная ставка: 500 руб.'
		puts 'Введите размер ставки'
		print 'Ввод >> '
		inp = readline.chop

		if inp[/^[1-9][0-9]*$/] && inp.to_i > 49 && inp.to_i < 1001
			return inp
		else
			puts 'Ошибка! Некорректная ставка. Ставка должна быть не менее 50 и не превышать 1000 руб.'
		end

		0
	end

	def game
		@card_valera = 4 + rand(18)
		@card_enemy = 4 + rand(18)
		input = 'Y'

		while @card_enemy < 18 || @card_valera < 21 && (input[0] == 'Y' || input[0] == 'y')
			system 'clear'

			if @card_valera < 21 && (input[0] == 'Y' || input[0] == 'y')
				print 'Ваши карты: ', @card_valera, "\n"
				print "Взять ещё карту? (Y/N)\nВвод >> "
				input = readline
			end
			if @card_valera < 21 && (input[0] == 'Y' || input[0] == 'y')
					@card_valera = turn @card_valera, true
			end
			@card_enemy = turn @card_enemy, false
		end

		system 'clear'
		print 'Ваши карты: ', @card_valera
		print ', Карты противника: ', @card_enemy, "\n"

		if @card_valera < 22 && @card_enemy < 22
			bet = condition_normal
		else
			bet = condition_overflow
		end
	end

	def condition_normal
		if @card_valera == @card_enemy
			puts 'Ничья.'
			return 0;
		elsif @card_valera > @card_enemy
			puts 'Победил Валера.'
			return 1
		else
			puts 'Победил соперник.'
			return -1;
		end
	end
	
	def condition_overflow
		@card_valera = (21 - @card_valera).abs
		@card_enemy = (21 - @card_enemy).abs

		if @card_valera == @card_enemy
			puts 'Ничья.'
			return 0;
		elsif @card_valera < @card_enemy
			puts 'Победил Валера.'
			return 1;
		else
			puts 'Победил соперник.'
			return -1;
		end
	end
end
