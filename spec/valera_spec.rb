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
        valera.go_work

        expect valera.money > 0
      }
    end
    context 'go_work_failed' do
      it {
        valera = Valera.new
        valera.mana = 75
        valera.fatigue = 25
        valera.money = 0
        valera.go_work

        expect valera.money == 0
      }
    end

    context 'rest' do
      it {
        valera = Valera.new
        valera.happiens = -1
        valera.mana = 30
        valera.fatigue = 45
        valera.rest

        expect valera.happiens == 0 && valera.fatigue == 15
      }
    end

    context 'drink_with_marginals_successful' do
      it {
        valera = Valera.new
        valera.happiens = 3
        valera.mana = 30
        valera.money = 2500
        valera.drink_with_marginals

        expect valera.mana > 30
      }
    end
    context 'drink_with_marginals_failed' do
      it {
        valera = Valera.new
        valera.happiens = 3
        valera.mana = 30
        valera.money = 500
        valera.drink_with_marginals

        expect valera.mana == 30
      }
    end

    context 'sing_drinked' do
      it {
        valera = Valera.new
        valera.mana = 50
        valera.money = 0

        valera.sing

        expect valera.money > 0
      }
    end
    context 'sing_sober' do
      it {
        valera = Valera.new
        valera.mana = 10
        valera.money = 0
        valera.sing

        expect valera.money == 0
      }
    end

    context 'see_serial' do
      it {
        valera = Valera.new
        valera.happiens = -2
        valera.mana = 30
        valera.fatigue = 25
        valera.see_serial

        expect valera.happiens == 0 && valera.fatigue == 10
      }
    end

    context 'sleep' do
      it {
        valera = Valera.new
        valera.happiens = -2
        valera.mana = 30
        valera.fatigue = 25
        valera.rest

        expect valera.mana == 0 && valera.happiens == -1
      }
    end

    context 'check_input_1' do
      it {
        obj = Valera.new
        obj.happiens = 4
        obj.mana = 75
        obj.fatigue = 100
        obj.money = 1000

        expect obj.check_input('1') == "\nВалера слишком пьян, чтобы идти на работу.\n"
      }
    end
    context 'check_input_2' do
      it {
        obj = Valera.new
        obj.happiens = 4
        obj.mana = 75
        obj.fatigue = 100
        obj.money = 1000

        expect obj.check_input('2') == "\nВалера немного отдохнул.\n"
      }
    end
    context 'check_input_3' do
      it {
        obj = Valera.new
        obj.happiens = 4
        obj.mana = 75
        obj.fatigue = 100
        obj.money = 1000

        expect obj.check_input('3') == "\nУ Валеры недостаточно денег, чтобы выпить с маргиналами.\n"
      }
    end
    context 'check_input_4' do
      it {
        obj = Valera.new
        obj.happiens = 4
        obj.mana = 5
        obj.fatigue = 100
        obj.money = 1000

        expect obj.check_input('4') == "\nСлучайные прохожие подкинули Валере о руб. за хорошее пение.\n"
      }
    end
    context 'check_input_5' do
      it {
        obj = Valera.new
        obj.happiens = 4
        obj.mana = 75
        obj.fatigue = 100
        obj.money = 1000

        expect obj.check_input('5') == "\nПросмотр хорошего сериала поднимет настроение. К тому же, Валера отдохнул.\n"
      }
    end
    context 'check_input_6' do
      it {
        obj = Valera.new
        obj.happiens = 4
        obj.mana = 75
        obj.fatigue = 100
        obj.money = 1000

        expect obj.check_input('6') == "\nВалера хорошо выспался, и он готов к новым трудовым будням.\n"
      }
    end
  end
end
