class Valera
  attr_accessor :mana, :happiens, :fatigue, :money

  def initialize
    @money = 0
  end

  def check_status
    if @mana <= 0
      @mana = 0
      @happiens -= 1
    end
    @mana = 100 if @mana > 100

    @fatigue = 0 if @fatigue.negative?
    if @fatigue >= 100
      @fatigue = 100
      @happiens -= 1
    end

    @happiens = 10 if @happiens > 10
  end

  def go_work
    if @mana <= 60
      @money += 1250
      @fatigue += 30
      @mana -= 15
      "\nНелюбимая работа приносит Валере стабильный доход. По крайней мере, когда он не пьяный в стельку.\n"
    else
      @mana -= 10
      "\nВалера слишком пьян, чтобы идти на работу.\n"
    end
  end

  def rest
    @fatigue -= 15
    @mana -= 5
    "\nВалера немного отдохнул.\n"
  end

  def drink_with_marginals
    if @money >= 1500
      @mana += 25
      @happiens += 3
      @money -= 1500
      "\nВстречи с собутыльниками по важному поводу всегда радуют Валеру. Правда, обходятся в копеечку.\n"
    else
      @mana -= 5
      "\nУ Валеры недостаточно средств для того, чтобы выпить с маргиналами.\n"
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

    "\nСлучайные прохожие подкинули Валере #{income} руб. за хорошее пение.\n"
  end

  def see_serial
    @happiens += 1
    @fatigue -= 10
    @mana -= 5
    "\nПросмотр хорошего сериала поднимет настроение. К тому же, Валера немного отдохнул.\n"
  end

  def sleep
    @happiens += 1
    @fatigue -= 75
    @mana -= 30
    "\nВалера хорошо выспался, и он готов к новым трудовым будням.\n"
  end

  def blackjack
    happiens = @happiens

    loop do
      system 'clear'
      card_valera = 0
      card_enemy = 0
      loop do
        card_valera += rand(2..11)
        card_enemy += rand(2..11)
        print 'Ваши карты: ', card_valera
        print 'Карты противника: ', card_enemy
        system 'clear'
      end
    end

    @happiens = happiens + 2
  end
end
