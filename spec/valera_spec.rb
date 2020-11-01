require './valera'

RSpec.describe Valera do
  describe '.valera' do
    context 'check_status' do
      it {
        valera = Valera.new
        valera.happiens = 4
        valera.mana = 0
        valera.fatigue = 100
        valera.check_status

        expect valera.happiens == 2
      }
    end

    context 'go_work_successful' do
      it {
        valera = Valera.new
        valera.mana = 25
        valera.fatigue = 25
        valera.money = 0
        valera.go_work(true)

        expect valera.money > 0
      }
    end
    context 'go_work_failed' do
      it {
        valera = Valera.new
        valera.mana = 75
        valera.fatigue = 25
        valera.money = 0
        valera.go_work(true)

        expect valera.money == 0
      }
    end

    context 'rest' do
      it {
        valera = Valera.new
        valera.happiens = -1
        valera.mana = 30
        valera.fatigue = 45
        valera.rest(true)

        expect valera.happiens == 0 && valera.fatigue == 15
      }
    end

    context 'drink_with_marginals_successful' do
      it {
        valera = Valera.new
        valera.happiens = 3
        valera.mana = 30
        valera.money = 2500
        valera.drink_with_marginals(true)

        expect valera.mana > 30
      }
    end
    context 'drink_with_marginals_failed' do
      it {
        valera = Valera.new
        valera.happiens = 3
        valera.mana = 30
        valera.money = 500
        valera.drink_with_marginals(true)

        expect valera.mana == 30
      }
    end

    context 'sing_drinked' do
      it {
        valera = Valera.new
        valera.mana = 50
        valera.money = 0

        valera.sing(true)

        expect valera.money > 0
      }
    end
    context 'sing_sober' do
      it {
        valera = Valera.new
        valera.mana = 10
        valera.money = 0
        valera.sing(true)

        expect valera.money == 0
      }
    end

    context 'see_serial' do
      it {
        valera = Valera.new
        valera.happiens = -2
        valera.mana = 30
        valera.fatigue = 25
        valera.see_serial(true)

        expect valera.happiens == 0 && valera.fatigue == 10
      }
    end

    context 'sleep' do
      it {
        valera = Valera.new
        valera.happiens = -2
        valera.mana = 30
        valera.fatigue = 25
        valera.rest(true)

        expect valera.mana == 0 && valera.happiens == -1
      }
    end
  end
end
