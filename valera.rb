class Valera
  attr_accessor :status

  def initialize(mana = 0, happiens = 0, money = 0, fatigue = 0)
    @status = {
      'mana' => mana,
      'happiens' => happiens,
      'fatigue' => fatigue,
      'money' => money
    }
  end

  def check_status(status)
    fix_status(status)
    if check_mana(status['mana']) && check_happiens(status['happiens']) \
       && check_fatigue(status['fatigue']) && check_money(status['money'])
      @status = status
      return true
    end
    false
  end

  def fix_status(status)
    status['mana'] = 0 if (status['mana']).negative?
    status['happiens'] = 10 if status['happiens'] > 10
    status['fatigue'] = 0 if (status['fatigue']).negative?
  end

  def check_mana(mana)
    mana >= 0 && mana <= 100
  end

  def check_happiens(happiens)
    happiens <= 10
  end

  def check_fatigue(fatigue)
    fatigue >= 0 && fatigue <= 100
  end

  def check_money(money)
    money >= 0
  end
end
