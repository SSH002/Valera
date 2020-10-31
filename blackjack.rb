class Blackjack
  attr_reader :card_valera, :card_enemy

  def begin(money)
    system 'clear'
    bet = 0
    loop do
      bet = select_bet.to_i
      break unless bet.zero?
    end

    while money >= bet
      money += bet * game
      puts "Текущий счёт: #{money}"
      print "\nХотите сыграть ещё? (Y)\nВвод >> "
      input = readline
      break if input[0] != 'Y' && input[0] != 'y'
    end

    money
  end

  def turn(card, player)
    buffer = rand(2..11)
    buffer = 1 if buffer == 11 && card > 10

    case player
    when true
      card += buffer
    when false
      card += buffer if card < 18
    end

    card
  end

  def select_bet
    puts 'Минимальная ставка: 50 руб, максимальная ставка: 1000 руб.'
    puts 'Введите размер ставки'
    print 'Ввод >> '
    inp = readline.chop

    return inp if inp[/^[1-9][0-9]*$/] && inp.to_i > 49 && inp.to_i < 1001

    puts 'Ошибка! Некорректная ставка. Ставка должна быть > 50 < 1000 руб.'

    0
  end

  def game
    @card_valera = rand(4..21)
    @card_enemy = rand(4..21)
    input = 'Y'

    while @card_enemy < 18 || @card_valera < 21 && (input[0] == 'Y' || input[0] == 'y')
      system 'clear'

      if @card_valera < 21 && (input[0] == 'Y' || input[0] == 'y')
        print "Ваши карты: #{@card_valera}\nВзять ещё карту? (Y)\nВвод >> "
        input = readline.chop
      end
      @card_valera = turn @card_valera, true if @card_valera < 21 && (input[0] == 'Y' || input[0] == 'y')
      @card_enemy = turn @card_enemy, false
    end

    system 'clear'
    print 'Ваши карты: ', @card_valera, ', Карты противника: ', @card_enemy, "\n"

    if @card_valera < 22 && @card_enemy < 22
      condition_normal
    else
      condition_overflow
    end
  end

  def condition_normal
    if @card_valera == @card_enemy
      puts 'Ничья.'
      0
    elsif @card_valera > @card_enemy
      puts 'Победил Валера.'
      1
    else
      puts 'Победил соперник.'
      -1
    end
  end

  def condition_overflow
    @card_valera = (21 - @card_valera).abs
    @card_enemy = (21 - @card_enemy).abs

    if @card_valera == @card_enemy
      puts 'Ничья.'
      0
    elsif @card_valera < @card_enemy
      puts 'Победил Валера.'
      1
    else
      puts 'Победил соперник.'
      -1
    end
  end
end
