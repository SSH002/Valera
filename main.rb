require_relative 'game'
require_relative 'interface'
require_relative 'reader'

class Main
  def initialize
    @game = Game.new
    @interface = Interface.new
    @valera = Valera.new
    @reader = Reader.new
  end

  def start
    loop do
      print "Мана: #{@valera.status['mana']}\n"
      print "Довольство: #{@valera.status['happiens']}\n"
      print "Усталость: #{@valera.status['fatigue']}\n"
      print "Деньги: #{@valera.status['money']}\n\n"

      @interface.print_actions
      @reader.read_action(@game)
      @valera = @game.do_action

      if @valera == false
        puts('Валера ушёл в запой! Конец игры')
        exit
      end
    end
  end
end

main = Main.new
main.start
