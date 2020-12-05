require './valera'

RSpec.describe Valera do
  describe '.valera' do
    valera = Valera.new
    context 'check_true' do
      status = {
        'mana' => 30,
        'happiens' => 5,
        'fatigue' => 0,
        'money' => 10_000
      }
      it { expect(valera.check_status(status)).to eq true }
    end
    context 'check_false' do
      status = {
        'mana' => 250,
        'happiens' => 5,
        'fatigue' => 0,
        'money' => 10_000
      }
      it { expect(valera.check_status(status)).to eq false }
    end
    context 'check_false' do
      status = {
        'mana' => 30,
        'happiens' => 5,
        'fatigue' => 250,
        'money' => 10_000
      }
      it { expect(valera.check_status(status)).to eq false }
    end
  end
end
