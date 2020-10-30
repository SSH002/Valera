require_relative 'valera'

class Game
	attr_reader :valera
	
	def initialize
		@valera = Valera.new
	end

	def victory
			loop do
				puts 'Поздравляем! Накоплено достаточно средств, чтобы Валера смог купить ноутбук'
				puts 'и стать фрилансером. Начать новую игру или выйти из игры?'
				print 'Ввод >> '

				input = readline

				if input[0] == 'y' || input[0] == 'Y'
					load_game('res/general.ini')
					game_menu
				elsif input[0] == 'n' || input[0] == 'N'
					exit 0
				else
					print "\nОшибка! Введена неверная команда.\n"
				end
		end
	end

	def game_menu
		system 'clear'
		loop do
			victory if valera.money >= 30000
			stats
			print "(1) - Пойти на работу\n"
			print "(2) - Отдыхать\n"
			print "(3) - Загрузитть игру\n"
			print "(4) - Сохранить игру\n"
			print "(5) - Выйти из игры\n"
			print 'Ввод >> '
			input = readline

			case input[0]
				when '1'
					valera.go_work
				when '2'
					valera.rest
				when '3'
					menu_load
				when '4'
					menu_save
				when '5'
					system 'clear'
					exit 0
			end
			system 'clear'
		end
	end

	def save_game file_name
		data = []
		data[1] = @valera.health
		data[2] = @valera.mana
		data[3] = @valera.happiens
		data[4] = @valera.fatigue
		data[5] = @valera.money

		File.open(file_name, 'w') do |file|
			data.each { |x| file.puts(x) }
		end
	end

	def load_game filename
		data = []
		File.open(filename, 'r') do |file|
			file.each_line { |x| data.push(x) }
		end

		@valera.health = (data[0].chop).to_i
		@valera.mana = (data[1].chop).to_i
		@valera.happiens = (data[2].chop).to_i
		@valera.fatigue = (data[3].chop).to_i
		@valera.money = (data[4].chop).to_i
	end

	def stats
		print 'Здоровье: ', @valera.health, "\n"
		print 'Мана: ', @valera.mana, "\n"
		print 'Довольство: ', @valera.happiens, "\n"
		print 'Усталость: ', @valera.fatigue, "\n"
		print 'Деньги: ', @valera.money, "\n\n"
	end

	def menu
		print "Вы в главном меню\n\n"
		print "(1) - Создать игру\n"
		print "(2) - Загрузить игру\n"
		print "(3) - Об игре\n"
		print "(4) - Выйти из игры\n"
		print 'Ввод >> '
	end

	def menu_load
		input = readline
		file_name = 'saves/' + input.chop + '.sv'

		loop do
			break if File.file?(file_name)
			print "Ошибка! Файл " + file_name + " не существует.\n"
			print "\nВведите название файла:\nВвод >> "
			input = readline
			file_name = 'saves/' + input.chop + '.sv'
		end

		load_game(file_name)
	end

	def menu_save
		input = readline
			
		file_name = 'saves/' + input.chop + '.sv'
		save_game(file_name)
	end

	def rules
		print "+---------------------------------------------------+\n"
		print "Данное приложение является реализацией игры \"Маргинал Валера\".\n"
		print "Цель игры: успешное окончание курсов по повышению квалификации.\n"
		print "Главный герой(ГГ) должен поддерживать себя в хорошем состоянии, а именно:\n"
		print "\n  1) Здоровье героя не должно опускаться ниже 0 (иначе ГГ умирает);"
		print "\n  2) Довольствие не должно опускаться ниже -8 (иначе ГГ уходит в запой);"
		print "\n  3) Усталость не должна превышать 90 (иначе ГГ уснёт прямо на месте);\n\n"
		print "При низком уровне маны (< 15) ГГ начинает терять очки довольства, и он\n"
		print "рискует впасть в депрессию.\n"
		print "+---------------------------------------------------+\n"
	end
end
