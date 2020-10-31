require './blackjack'

RSpec.describe Blackjack do
  describe '.blackjack' do
    context 'valera_win' do
      it { expect(Blackjack.new(20, 18).condition_normal(true)).to eq 1 }
    end
    context 'valera_win2' do
      it { expect(Blackjack.new(22, 25).condition_overflow(true)).to eq 1 }
    end
    context 'valera_fail' do
      it { expect(Blackjack.new(16, 21).condition_normal(true)).to eq(-1) }
    end
    context 'valera_fail2' do
      it { expect(Blackjack.new(27, 23).condition_overflow(true)).to eq(-1) }
    end
    context 'draw' do
      it { expect(Blackjack.new(21, 21).condition_normal(true)).to eq 0 }
    end
    context 'draw2' do
      it { expect(Blackjack.new(23, 23).condition_overflow(true)).to eq 0 }
    end
  end
end
