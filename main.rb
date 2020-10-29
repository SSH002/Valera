require_relative 'game'

input = '!'
obj = Game.new

system 'clear'
loop do
	obj.menu
	input = readline

		system 'clear'
		case input[0]
		when '1'
			obj.load_game('res/general.ini')
			obj.game_menu
		when '2'
			obj.menu_load
			obj.game_menu
		when '3'
			obj.rules
		when '4'
			break
		else
			print "Ошибка! Введена неверная команда. Список допустимых команд смотрите в меню.\n\n"
	end
end
