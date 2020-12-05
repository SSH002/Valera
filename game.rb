require_relative 'valera'
require_relative 'actions'
require_relative 'saver'

class Game
  attr_accessor :action_item, :valera, :actions

  @actions = {
    1 => ->(status) { Actions.go_work(status) },
    2 => ->(status) { Actions.rest(status) },
    3 => ->(status) { Actions.drink_with_marginals(status) },
    4 => ->(status) { Actions.sing(status) },
    5 => ->(status) { Actions.see_serial(status) },
    6 => ->(status) { Actions.sleep(status) },
    7 => ->(status) { Saver.save_load_menu(status, 7) },
    8 => ->(status) { Saver.save_load_menu(status, 8) },
    9 => ->(_status) { exit }
  }

  def initialize
    @valera = Valera.new
  end

  class << self
    attr_reader :actions
  end

  def check_action(status)
    return (@valera.status['mana'] >= 70) || (@valera.check_status(status) == false) if @action_item == 1

    @valera.check_status(status) == false
  end

  def do_action
    status = Game.actions[@action_item].call(@valera.status.clone)
    system('clear')
    puts("\nНедопустимое действие! Попробуйте снова") if check_action(status)
    return false if @valera.status['happiens'] <= -10

    valera
  end
end
