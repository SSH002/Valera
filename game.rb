require_relative 'valera'

class Game
  attr_reader :valera

  def initialize
    @valera = Valera.new
  end

  def victory
    system 'clear'
    puts 'Поздравляю! Накоплено достаточно средств, чтобы Валера мог купить себе ноутбук и стать фрилансером.'
    start_end_game
  end

	def check_status
		if @valera.health <= 0
			puts 'Вы погибли!'
		@valera.health = 100 elsif @valera.health > 100
		end

		if @valera.mana <= 0
			@valera.mana = 0
			@valera.happiens = @valera.happiens - 1
		elsif @valera.mana > 100
			@valera.mana = 100
		end
		
		if @valera.happiens <= -10
			system 'clear'
			puts 'Валера сломался пот гнётом судьбы, не выдержав испытаний, что на него выпали.'
			puts 'Валера, стремясь восстановить душевное равновесие, ушёл в запой.'
			puts '==============================ИГРА=ОКОНЧЕНА=============================='
			start_end_game
		elsif @valera.happiens > 10
			@valera.happiens = 10
		end

		if @valera.fatigue < 0
			@valera.fatigue = 0
		elsif @valera.fatigue >= 100
			@valera.fatigue = 100
			@valera.happiens = @valera.happiens - 1
		end
	end

	def start_end_game
		loop do
			puts 'Хотите начать сначала, или выйти из игры?'
			print 'Ввод >> '
			input = readline

			case input[0]
				when 'Y', 'y'
					load_game('res/general.ini')
					game_menu
				when 'N', 'n'
					exit 0
				else
					print "\nВведены неверные данные! Введите \'Y\' или \'N\'\n"
			end
		end
	end

  def game_menu
    system 'clear'
    loop do
      victory if @valera.money >= 30000

	  check_status
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
    data[0] = @valera.health
    data[1] = @valera.mana
    data[2] = @valera.happiens
    data[3] = @valera.fatigue
    data[4] = @valera.money

    File.open(file_name, 'w') do |file|
      data.each { |x| file.puts(x) }
    end
  end

  def load_game(filename)
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
    print "Здоровье: #{@valera.health}\n"
    print "Мана: #{@valera.mana}", "\n"
    print "Довольство: #{@valera.happiens}\n"
    print "Усталость: #{@valera.fatigue}\n"
    print "Деньги: #{@valera.money}\n\n"
  end

  def menu
    print "Вы в главном меню\n\n"
    print "(1) - Начать новую игру\n"
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
      print "Ошибка! Файл #{input.chop} не существует.\n"
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
    puts '+---------------------------------------------------+'
    puts 'Данное приложение является реализацией игры \"Маргинал Валера\".'
    puts 'Цель игры: успешное окончание курсов по повышению квалификации.'
    puts 'Главный герой(ГГ) должен поддерживать себя в хорошем состоянии, а именно:'
    puts "\n  1) Здоровье героя не должно опускаться ниже 0 (иначе ГГ умирает);"
    puts "  2) Довольствие не должно опускаться ниже -10 (иначе ГГ уходит в запой);\n\n"
    puts 'При мане = 0, ГГ начинает терять очки довольства (-1) при каждом действии;'
    puts 'При усталости = 100, ГГ начинает терять очки довольства (-1) при каждом действии;'
    puts 'Негативные эффекты могут суммироваться.'
    puts '+---------------------------------------------------+'
  end
end
