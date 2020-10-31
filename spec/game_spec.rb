require './game'

RSpec.describe Game do
  describe '.game' do
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
      it { expect(Game.new.save_game('res/general.ini')).to eq 0 }
    end
  end
end
