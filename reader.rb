class Reader
  def read_action(game)
    loop do
      game.action_item = gets.chomp.to_i
      return unless (game.action_item < 1) || (game.action_item > 9)

      puts('Ошибка! Такого действия нет. Введите значение в диапозоне от 1 до 9')
    end
  end
end
