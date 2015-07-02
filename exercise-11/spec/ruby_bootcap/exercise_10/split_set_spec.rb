require 'ostruct'
require 'ruby_bootcamp/exercise_10/split_set'
module RubyBootcamp
  module Exercise10
    describe SplitSet do

      let(:value_1) { OpenStruct.new(id: 1) }
      let(:value_2) { OpenStruct.new(id: 2) }

      describe '#add' do
        before do
          subject.add id: value_1.id, value: value_1, percentage: 50
        end

        it 'stores a value' do
          expect(subject[value_1.id]).to be(value_1)
        end

        it 'assigns selection boundaries' do
          subject.add id: value_2.id, value: value_2, percentage: 50
          first = subject.values.first
          second = subject.values.last

          expect(first.lower).to eq(0)
          expect(first.upper).to eq(50)

          expect(second.lower).to eq(50)
          expect(second.upper).to eq(100)
        end

      end

      describe '#resolve' do
        before do
          subject.add id: value_1.id, value: value_1, percentage: 50
          subject.add id: value_2.id, value: value_2, percentage: 50
        end

        context 'rand returns a number within a boundry' do
          it 'it returns the entry with that set of boundaries' do
            expect(subject).to receive(:rand).and_return(15)
            expect(subject.resolve).to eq(value_1)
          end
        end

        context 'rand returns a number equal to the lower boundary of an entry' do
          it 'it returns the entry whos lower boundary is equal to that number' do
            expect(subject).to receive(:rand).and_return(50)
            expect(subject.resolve).to eq(value_2)
          end
        end
      end

      describe '#transform' do
        it "replaces the stores values with what's returned from the block" do
          subject.add id: value_1.id, value: value_1, percentage: 50
          value_before_transform = subject[value_1.id]
          subject.transform do |value|
            expect(value).to be(value_before_transform)
            :transformed_value
          end

          expect(subject[value_1.id]).to eq(:transformed_value)
        end
      end

      describe "#valid?" do

        context 'splits == to 100' do
          it 'returns true' do
            subject.add id: value_1.id, value: value_1, percentage: 50
            subject.add id: value_2.id, value: value_2, percentage: 50
            expect(subject).to be_valid
          end
        end

        context 'splits not == 100' do
          it 'returns false' do
            subject.add id: value_1.id, value: value_1, percentage: 50
            expect(subject).to_not be_valid
          end
          it 'gives a warning' do
            expect(subject).to receive(:warn).with('splits do not add up to 100% and no default has been specified')
            subject.valid?
          end
        end

        context 'no entries added' do
          it 'returns false' do
            expect(subject).to_not be_valid
          end
        end
      end
    end

  end
end