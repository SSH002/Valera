require_relative 'blackjack'
require_relative 'valera'
require_relative 'blackjack'
require_relative 'interface'

class Game
<<<<<<< HEAD
  attr_reader :valera, :interface, :blackjack
=======
  attr_reader :valera, :blackjack
>>>>>>> 69d992d5030c1708a9126d0a8c1de447d806a39a

  def initialize
    @valera = Valera.new
    @blackjack = Blackjack.new
<<<<<<< HEAD
    @interface = Interface.new
=======
>>>>>>> 69d992d5030c1708a9126d0a8c1de447d806a39a
  end

  def victory
    system 'clear'
    puts 'Поздравляю! Накоплено достаточно средств, чтобы Валера мог купить себе ноутбук и стать фрилансером.'
    end_game
  end

<<<<<<< HEAD
  def depression
    system 'clear'
    puts 'Валера сломался пот гнётом судьбы, не выдержав испытаний, что на него выпали.'
    puts 'Валера, стремясь восстановить душевное равновесие, ушёл в запой.'
    puts '==================================ПОТРАЧЕНО=================================='
    end_game
  end

  def end_game
    puts 'Хотите начать сначала (Y), или выйти из игры?'
    print 'Ввод >> '
    input = readline

    case input[0]
    when 'Y', 'y'
      load_game('res/general.ini')
      game_menu
    else
      exit 0
    end
  end

  def stats(result)
    print "Мана: #{@valera.mana}", "\n"
    print "Довольство: #{@valera.happiens}\n"
    print "Усталость: #{@valera.fatigue}\n"
    print "Деньги: #{@valera.money}\n"
    print "#{result}\n"
=======
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

    if @valera.fatigue.negative?
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
>>>>>>> 69d992d5030c1708a9126d0a8c1de447d806a39a
  end

  def in_game_menu(result)
    system 'clear'
<<<<<<< HEAD
    victory if @valera.money >= 30_000

    @valera.check_status
    depression if @valera.happiens < -9
    stats(result)
    @interface.action_list
  end
=======
    loop do
      victory if @valera.money >= 30_000

      check_status
      stats
      print "(1) - Пойти на работу\n"
      print "(2) - Отдыхать\n"
      print "(3) - Выпить с маргиналами\n"
      print "(4) - Спеть\n"
      print "(5) - Посмотреть сериал\n"
      print "(6) - Спать\n"
      print "(7) - Сыграть в \"21\"\n"
      print "(8) - Загрузитть игру\n"
      print "(9) - Сохранить игру\n"
      print "(0) - Выйти в главное меню\n"
      print 'Ввод >> '
      input = readline
>>>>>>> 69d992d5030c1708a9126d0a8c1de447d806a39a

  def game_menu
    result = ''
    loop do
      in_game_menu(result)
      input = readline.chop
      case input
      when '1'
        result = @valera.go_work
      when '2'
        result = @valera.rest
      when '3'
        result = @valera.drink_with_marginals
      when '4'
        result = @valera.sing
      when '5'
        result = @valera.see_serial
      when '6'
<<<<<<< HEAD
        result = @valera.sleep
=======
        valera.sleep
      when '7'
        loop do
          bet = @blackjack.select_bet.to_i
          break unless bet.zero?
        end

        while @valera.money > bet
          @valera.money = @valera.money + bet * @blackjack.game
          puts "Текущий счёт: #{@valera.money}"
          print "\nХотите сыграть ещё? (Y/N)\nВвод >> "
          input = readline
          break if input[0] != 'Y' && input[0] != 'y'
        end
      when '8'
        menu_load
      when '9'
        menu_save
      when '0'
        system 'clear'
        break
      else
        print "Ошибка! Введена неверная команда. Список допустимых команд смотрите в меню.\n"
>>>>>>> 69d992d5030c1708a9126d0a8c1de447d806a39a
      end
      break if check_input(input) == '0'
    end
  end

  def check_input(input)
    case input
    when '7'
      @valera.money = @blackjack.begin(@valera.money)
    when '8'
      load_game(@interface.menu_load)
    when '9'
      save_game(@interface.menu_save)
    when '0'
      '0'
    end
  end

  def load_game(filename)
    data = []
    File.open(filename, 'r') do |file|
      file.each_line { |x| data.push(x) }
    end

<<<<<<< HEAD
    @valera.mana = data[0].chop.to_i
    @valera.happiens = data[1].chop.to_i
    @valera.fatigue = data[2].chop.to_i
    @valera.money = data[3].chop.to_i
=======
    @valera.health = data[0].chop.to_i
    @valera.mana = data[1].chop.to_i
    @valera.happiens = data[2].chop.to_i
    @valera.fatigue = data[3].chop.to_i
    @valera.money = data[4].chop.to_i
  end

  def stats
    print "Здоровье: #{@valera.health}\n"
    print "Мана: #{@valera.mana}", "\n"
    print "Довольство: #{@valera.happiens}\n"
    print "Усталость: #{@valera.fatigue}\n"
    print "Деньги: #{@valera.money}\n\n"
>>>>>>> 69d992d5030c1708a9126d0a8c1de447d806a39a
  end

  def save_game(file_name)
    data = []
    data[0] = @valera.mana
    data[1] = @valera.happiens
    data[2] = @valera.fatigue
    data[3] = @valera.money

    File.open(file_name, 'w') do |file|
      data.each { |x| file.puts(x) }
    end
  end
end
