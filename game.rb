require_relative 'valera'
require_relative 'blackjack'
require_relative 'interface'

class Game
  attr_reader :valera, :interface, :blackjack

  def initialize
    @valera = Valera.new
    @blackjack = Blackjack.new
    @interface = Interface.new
  end

  def victory
    system 'clear'
    puts 'Поздравляю! Накоплено достаточно средств, чтобы Валера мог купить себе ноутбук и стать фрилансером.'
    end_game
  end

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
  end

  def in_game_menu(result)
    system 'clear'
    victory if @valera.money >= 30_000

    @valera.check_status
    depression if @valera.happiens < -9
    stats(result)
    @interface.action_list
  end

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
        result = @valera.sleep
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

    @valera.mana = data[0].chop.to_i
    @valera.happiens = data[1].chop.to_i
    @valera.fatigue = data[2].chop.to_i
    @valera.money = data[3].chop.to_i
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
