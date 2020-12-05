require './actions'

RSpec.describe Actions do
  describe '.actions' do
    status = {
      'mana' => 30,
      'happiens' => 5,
      'fatigue' => 0,
      'money' => 10_000
    }

    context 'go_work' do
      expected = {
        'mana' => 15,
        'happiens' => 5,
        'fatigue' => 30,
        'money' => 11_250
      }
      it { expect(Actions.go_work(status.clone)).to eq expected }
    end
    context 'rest' do
      expected = {
        'mana' => 25,
        'happiens' => 6,
        'fatigue' => -30,
        'money' => 10_000
      }
      it { expect(Actions.rest(status.clone)).to eq expected }
    end
    context 'see_serial' do
      expected = {
        'mana' => 25,
        'happiens' => 7,
        'fatigue' => -15,
        'money' => 10_000
      }
      it { expect(Actions.see_serial(status.clone)).to eq expected }
    end
    context 'drink_with_marginals' do
      expected = {
        'mana' => 55,
        'happiens' => 8,
        'fatigue' => 0,
        'money' => 8500
      }
      it { expect(Actions.drink_with_marginals(status.clone)).to eq expected }
    end
    context 'sing' do
      expected = {
        'mana' => 15,
        'happiens' => 6,
        'fatigue' => 0,
        'money' => 10_050
      }
      it { expect(Actions.sing(status.clone)).to eq expected }
    end
    context 'sleep' do
      expected = {
        'mana' => 0,
        'happiens' => 6,
        'fatigue' => -75,
        'money' => 10_000
      }
      it { expect(Actions.sleep(status.clone)).to eq expected }
    end
  end
end
