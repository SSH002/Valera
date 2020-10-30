require_relative 'valera'

class Game
  attr_reader :valera

  def initialize
    @valera = Valera.new
  end

  def game_menu
    system 'clear'
    loop do
      stats
      print "(1) - Пойти на работу\n"
      print "(2) - Отдыхать\n"
      print "(3) - Выпить с маргиналами\n"
      print "(4) - Спеть\n"
      print "(5) - Посмотреть сериал\n"
      print "(6) - Спать\n"
      print "(7) - Загрузитть игру\n"
      print "(8) - Сохранить игру\n"
      print "(9) - Выйти в главное меню\n"
      print 'Ввод >> '
      input = readline

      case input[0]
      when '1'
        valera.go_work
      when '2'
        valera.rest
      when '3'
        valera.drink_with_marginals
      when '4'
        valera.sing
      when '5'
        valera.see_serial
      when '6'
        valera.sleep
      when '7'
        menu_load
      when '8'
        menu_save
      when '9'
        system 'clear'
        break
      else
        print "Ошибка! Введена неверная команда. Список допустимых команд смотрите в меню.\n"
      end
      system 'clear'
    end
  end

  def save_game(file_name)
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

  def load_game(filename)
    data = []
    File.open(filename, 'r') do |file|
      file.each_line { |x| data.push(x) }
    end

    @valera.health = data[0].chop
    @valera.mana = data[1].chop
    @valera.happiens = data[2].chop
    @valera.fatigue = data[3].chop
    @valera.money = data[4].chop
  end

  def stats
    print 'Здоровье: ', @valera.health, "\n"
    print "Мана: #{@valera.mana}", "\n"
    print "Довольство: #{@valera.happiens}", "\n"
    print "Усталость: #{@valera.fatigue}", "\n"
    print "Деньги: #{@valera.money}", "\n\n"
  end

  def menu
    print "Вы в главном меню\n\n"
    print "(1) - Создать игру\n"
    print "(2) - Загрузить игру\n"
    print "(3) - Об игре\n"
    print "(4) - Выйти из игры\n"
    print 'Ввод >> '
  end

  def file_list(directory, file_name_end)
    files = Dir["#{directory}/*.#{file_name_end}"]

    print "Список ранее сохранённых игр:\n"
    print "+---------------------------------------------------+\n"
    files.each do |file_name|
      file_name["#{directory}/"] = ''
      file_name[".#{file_name_end}"] = ''
      print '| ', file_name, "\n"
    end
    print "+---------------------------------------------------+\n"
    print "\nВведите название файла:\nВвод >> "
  end

  def menu_load
    system 'clear'
    file_list('saves', 'sv')
    input = readline
    file_name = "saves/#{input.chop}.sv"

    loop do
      break if File.file?(file_name)

      system 'clear'
      print "Ошибка! Файл #{file_name} не существует.\n"
      file_list('saves', 'sv')
      print "\nВведите название файла:\nВвод >> "
      input = readline
      file_name = "saves/#{input.chop}.sv"
    end

    load_game(file_name)
  end

  def menu_save
    loop do
      system 'clear'
      file_list('saves', 'sv')
      input = readline

      file_name = "saves/#{input.chop}.sv"
      if File.file?(file_name)
        print "\nФайл с таким названием уже существует. Перезаписать? (Y/N)\nВвод >> "
        inp = readline

        case inp[0]
        when 'y', 'Y'
          save_game(file_name)
          break
        when 'n', 'N'
        else
          print "\nОшибка! Введите \"Y\" или \"N\".\n"
        end
      else
        save_game(file_name)
        break
      end
    end
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
