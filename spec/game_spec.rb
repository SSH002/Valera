require './game'

RSpec.describe Game do
  describe '.game' do
    context 'game_victory' do
      it {
        obj = Game.new
        obj.valera.mana = 0
        obj.valera.fatigue = 0
        obj.valera.money = 50_000
        obj.valera.happiens = 0

        expect obj.game_menu(true) == 2
      }
    end
    context 'game_defeat' do
      it {
        obj2 = Game.new
        obj2.valera.mana = 0
        obj2.valera.fatigue = 0
        obj2.valera.money = 500
        obj2.valera.happiens = -11

        expect obj2.game_menu(true) == 1
      }
    end

    context 'load_game_successful' do
      it { expect(Game.new.load_game('res/general.ini')).to eq 1 }
    end
    context 'load_game_failed' do
      it {
        data = []
        data[0] = 5
        data[1] = 5
        data[2] = 5
        data[3] = 5
        data[4] = 5

        File.open('saves/test_save.sv', 'w') do |file|
          data.each { |x| file.puts(x) }
        end

        expect(Game.new.load_game('saves/test_save.sv')).to eq 0
      }
    end

    context 'save_game_successful' do
      it {
        File.delete('saves/test_save.sv')
        expect(Game.new.save_game('saves/save_test.sv')).to eq 1
      }
    end
    context 'save_game_failed' do
      it {
        File.delete('saves/save_test.sv')
        expect(Game.new.save_game('res/general.ini')).to eq 0
      }
    end
  end
end
