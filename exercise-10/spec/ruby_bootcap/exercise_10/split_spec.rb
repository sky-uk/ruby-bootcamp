require 'ostruct'
require 'ruby_bootcamp/exercise_10/split'
describe RubyBootcamp::Exercise10::Split do
  describe '#==' do
    subject do
      described_class.new(0,25, :value)
    end

    context 'other is not a split' do
      it 'returns false' do
        other = OpenStruct.new(upper: 0, lower: 25, value: :valie)
        expect(subject).to_not eq(other)
      end
    end

    context 'splits have different lower bound' do
      it 'returns false' do
        other = described_class.new(10, subject.upper, :value)
        expect(subject).to_not eq(other)
      end
    end
    context 'splits have different upper bound' do
      it 'returns false' do
        other = described_class.new(subject.lower, 15, :value)
        expect(subject).to_not eq(other)
      end
    end

    context 'lower and upper bounds are the same' do
      it 'returns true' do
        other = described_class.new(subject.lower,subject.upper, :value)
        expect(subject).to eq(other)
      end
    end
  end
end
