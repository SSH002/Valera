require_relative 'game'

obj = Game.new

system 'clear'
loop do
  puts '(1) - Начать новую игру'
  puts '(2) - Загрузить игру'
  puts '(3) - Об игре'
  print "(4) - Выйти из игры\nВвод >> "
  input = readline

  system 'clear'
  case input[0]
  when '1'
    obj.load_game('res/general.ini')
    obj.game_menu(false)
    system 'clear'
  when '2'
    obj.load_game(obj.interface.menu_load(false, ''))
    obj.game_menu(false)
    system 'clear'
  when '3'
    print "Данное приложение является реализацией игры \"Маргинал Валера\".\nЦель игры: накопить 30000 рублей и"
    print " не впасть в депрессию. \nГлавный герой(ГГ) должен поддерживать себя в хорошем состоянии, а именно:\n"
    print "Довольствие не должно опускаться до -10 (иначе ГГ уходит в запой);\n"
    print "При мане = 0, ГГ теряет очки довольства (-1) при каждом действии;\nПри усталости = 100, ГГ теряет очки "
    print "довольства (-1) при каждом действии;\nОтрицательные эффекты суммируются.\n\n"
  when '4'
    break
  end
end
