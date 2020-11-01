class Valera
  attr_accessor :mana, :happiens, :fatigue, :money

  def initialize; end

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

  def check_input(input)
    case input
    when '1'
      go_work
    when '2'
      rest
    when '3'
      drink_with_marginals
    when '4'
      sing
    when '5'
      see_serial
    when '6'
      sleep
    end
  end

  def go_work
    if @mana <= 60
      @money += 1250
      @fatigue += 30
      @mana -= 15
      "\nНелюбимая работа приносит Валере стабильный доход. По крайней мере, когда он не пьяный.\n"
    else
      @mana -= 5
      "\nВалера слишком пьян, чтобы идти на работу.\n"
    end
  end

  def rest
    @happiens += 1
    @fatigue -= 30
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
      "\nУ Валеры недостаточно денег, чтобы выпить с маргиналами.\n"
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
    @happiens += 2
    @fatigue -= 15
    @mana -= 5
    "\nПросмотр хорошего сериала поднимет настроение. К тому же, Валера отдохнул.\n"
  end

  def sleep
    @happiens += 1
    @fatigue -= 75
    @mana -= 30
    "\nВалера хорошо выспался, и он готов к новым трудовым будням.\n"
  end
end
