require_relative 'valera'
require_relative 'interface'

class Game
  attr_reader :valera, :interface

  def initialize
    @valera = Valera.new
    @interface = Interface.new
  end

  def check_end_game(test)
    if @valera.money >= 30_000

      system 'clear'
      puts 'Поздравляем! Накоплено достаточно средств, чтобы Валера мог купить себе ноутбук и стать фрилансером.'
      puts 'Теперь Валера сможет браться за заказы по вёрстке сайтов, не отходя от домашнего мини-бара.'
      puts '***=========================================!!!ПОБЕДА!!!=========================================***'
      end_game if test == false
      return 2
    end
    if @valera.happiens < -9

      system 'clear'
      puts 'Валера сломался пот гнётом судьбы, не выдержав испытаний, что на него выпали.'
      puts 'Валера, стремясь восстановить душевное равновесие, ушёл в запой.'
      puts '==================================ПОТРАЧЕНО=================================='
      end_game if test == false
      return 1
    end
    0
  end

  def end_game
    print "Хотите начать сначала (Y), или выйти из игры?\nВвод >> "

    if readline.chop == 'y'
      load_game('res/general.ini')
      game_menu(false)
    end
    exit
  end

  def in_game_menu(result, test)
    system 'clear'

    @valera.check_status if test == false
    print "Мана: #{@valera.mana}\n"
    print "Довольство: #{@valera.happiens}\n"
    print "Усталость: #{@valera.fatigue}\n"
    print "Деньги: #{@valera.money}\n"
    print "#{result}\n"
    @interface.action_list
    check = check_end_game(test)
    return check if test == true
  end

  def game_menu(test)
    result = ''
    loop do
      check = in_game_menu(result, test)
      input = readline.chop if test == false
      case input
      when '1', '2', '3', '4', '5', '6'
        result = @valera.check_input(input)
      when '7'
        load_game(@interface.menu_load(false, ''))
      when '8'
        save_game(@interface.menu_save(false, ''))
      when '9'
        break
      else
        result = ''
        @valera.happiens += 1 if @valera.mana.zero?
        @valera.happiens += 1 if @valera.fatigue == 100
      end
      return check if test == true
    end
  end

  def load_game(file_name)
    data = []
    File.open(file_name, 'r') do |file|
      file.each_line { |x| data.push(x) }
    end

    return 0 if data.count != 4

    @valera.mana = data[0].to_i
    @valera.happiens = data[1].to_i
    @valera.fatigue = data[2].to_i
    @valera.money = data[3].to_i

    1
  end

  def save_game(file_name)
    data = []
    data[0] = @valera.mana
    data[1] = @valera.happiens
    data[2] = @valera.fatigue
    data[3] = @valera.money

    return 0 if File.file?(file_name)

    File.open(file_name, 'w') do |file|
      data.each { |x| file.puts(x) }
    end

    1
  end
end
