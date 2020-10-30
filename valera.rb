class Valera
  attr_accessor :health, :mana, :happiens, :fatigue, :money

  def initialize
    @money = 0
  end

  def go_work
    @money += 1000
    @fatigue += 30
    @mana -= 15
  end

  def rest
    @fatigue -= 15
    @mana -= 10
  end

  def drink_with_marginals
    if @money >= 1500
      @mana += 25
      @happiens += 3
      @money -= 1500
    else
      puts 'У Валеры недостаточно средств для того, чтобы выпить с маргиналами.'
    end
  end

  def sing
    income = 0

    if @mana >= 30
      income = rand(50..450)
      @money += income
    else
      income = 0
    end
    @mana -= 15

    income
  end

  def see_serial
    @happiens += 2
    @fatigue -= 20
    @mana -= 15
  end

  def sleep
    @happiens += 1
    @fatigue -= 50
    @mana -= 30
  end

  def blackjack
    loop do
      system 'clear'
      card_valera = 0
      card_enemy = 0
      loop do
        card_valera = card_valera + 2 + rand(10)
        card_enemy = card_enemy + 2 + rand(10)
        print 'Ваши карты: ', card_valera
        print 'Карты противника: ', card_enemy
        system 'clear'
      end
    end
  end
end
