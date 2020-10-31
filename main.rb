require_relative 'game'

input = '!'
obj = Game.new

system 'clear'
loop do
  print "(1) - Начать новую игру\n"
  print "(2) - Загрузить игру\n"
  print "(3) - Об игре\n"
  print "(4) - Выйти из игры\nВвод >> "
  input = readline

  system 'clear'
  case input[0]
  when '1'
    obj.load_game('res/general.ini')
    obj.game_menu
  when '2'
    obj.load_game(obj.interface.menu_load)
    obj.game_menu
  when '3'
    print "Данное приложение является реализацией игры \"Маргинал Валера\".\nЦель игры: успешное окончание курсов "
    print "по повышению квалификации. \nГлавный герой(ГГ) должен поддерживать себя в хорошем состоянии, а именно:\n"
    print "Довольствие не должно опускаться ниже -10 (иначе ГГ уходит в запой);\n"
    print "При мане = 0, ГГ теряет очки довольства (-1) при каждом действии;\nПри усталости = 100, ГГ теряет очки "
    print "довольства (-1) при каждом действии;\nОтрицательные и положительные эффекты суммируются.\n\n"
  when '4'
    break
  end
end
