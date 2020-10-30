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
    puts 'Ошибка! Введена неверная команда. Список допустимыхх команд смотрите в меню.'
  end
end
