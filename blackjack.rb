class Blackjack
  attr_reader :card_valera, :card_enemy

<<<<<<< HEAD
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

=======
>>>>>>> 69d992d5030c1708a9126d0a8c1de447d806a39a
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
<<<<<<< HEAD
    puts 'Минимальная ставка: 50 руб, максимальная ставка: 1000 руб.'
=======
    puts 'Минимальная ставка: 50 руб, максимальная ставка: 500 руб.'
>>>>>>> 69d992d5030c1708a9126d0a8c1de447d806a39a
    puts 'Введите размер ставки'
    print 'Ввод >> '
    inp = readline.chop

<<<<<<< HEAD
    return inp if inp[/^[1-9][0-9]*$/] && inp.to_i > 49 && inp.to_i < 1001

    puts 'Ошибка! Некорректная ставка. Ставка должна быть > 50 < 1000 руб.'
=======
    if inp[/^[1-9][0-9]*$/] && inp.to_i > 49 && inp.to_i < 1001
      return inp
    else
      puts 'Ошибка! Некорректная ставка. Ставка должна быть не менее 50 и не превышать 1000 руб.'
    end
>>>>>>> 69d992d5030c1708a9126d0a8c1de447d806a39a

    0
  end

  def game
    @card_valera = rand(4..21)
    @card_enemy = rand(4..21)
    input = 'Y'

    while @card_enemy < 18 || @card_valera < 21 && (input[0] == 'Y' || input[0] == 'y')
      system 'clear'

      if @card_valera < 21 && (input[0] == 'Y' || input[0] == 'y')
<<<<<<< HEAD
        print "Ваши карты: #{@card_valera}\nВзять ещё карту? (Y)\nВвод >> "
        input = readline.chop
=======
        print 'Ваши карты: ', @card_valera, "\n"
        print "Взять ещё карту? (Y/N)\nВвод >> "
        input = readline
>>>>>>> 69d992d5030c1708a9126d0a8c1de447d806a39a
      end
      @card_valera = turn @card_valera, true if @card_valera < 21 && (input[0] == 'Y' || input[0] == 'y')
      @card_enemy = turn @card_enemy, false
    end

    system 'clear'
<<<<<<< HEAD
    print 'Ваши карты: ', @card_valera, ', Карты противника: ', @card_enemy, "\n"

    if @card_valera < 22 && @card_enemy < 22
      condition_normal
    else
      condition_overflow
    end
=======
    print 'Ваши карты: ', @card_valera
    print ', Карты противника: ', @card_enemy, "\n"

    bet = if @card_valera < 22 && @card_enemy < 22
            condition_normal
          else
            condition_overflow
          end
>>>>>>> 69d992d5030c1708a9126d0a8c1de447d806a39a
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
