require './interface'

RSpec.describe Interface do
  describe '.interface' do
    context 'menu_load' do
      it {
        File.open('saves/test_save.sv', 'w')
        expected = 'saves/test_save.sv'
        inp = 'test_save'

        expect(Interface.new.menu_load(true, inp)).to eq expected
      }
    end
    context 'menu_save' do
      it {
        File.delete('saves/test_save.sv')
        expected = 'saves/save_test.sv'
        inp = 'save_test'

        expect(Interface.new.menu_save(true, inp)).to eq expected
      }
    end
  end
end
