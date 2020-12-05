require './saver'

RSpec.describe Saver do
  describe '.saver' do
    context 'save_load_menu' do
      status = {
        'mana' => 10,
        'happiens' => -10,
        'fatigue' => 25,
        'money' => 2500
      }

      it {
        allow($stdin).to receive(:gets).and_return('test_save')
        Saver.save_load_menu(status, 8)
        curr_status = Saver.save_load_menu(status, 7)
        expect(curr_status).to eq status
      }
    end
  end
end
