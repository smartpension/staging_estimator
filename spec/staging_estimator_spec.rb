require 'spec_helper'

describe StagingEstimator do
  describe '.get' do
    context "when more than 30 employees" do
      it 'returns a date according to the number of employee' do
        date = described_class.get(4400)
        expect(date).to be_eql Date.new(2013, 5, 1)
      end
    end

    context "when exactly 30 employees" do
      it 'returns a date according to the number of employee' do
        date = described_class.get(30)
        expect(date).to be_eql Date.new(2015, 10, 1)
      end
    end

    context "when less than 30 employees" do
      it 'returns a date according to the reference' do
        date = described_class.get(20, '04')
        expect(date).to be_eql Date.new(2016, 1, 1)
      end

      context 'when the reference is nil' do
        it 'returns an empty string' do
          date = described_class.get(20)
          expect(date).to be_nil
        end
      end

      context 'when the reference is an exception' do
        it 'returns a date from the exception list' do
          date = described_class.get(20, 'BX')
          expect(date).to be_eql Date.new(2015, 7, 1)
        end
      end

      context 'when the reference is not in any range' do
        it 'returns the default date' do
          date = described_class.get(20, '99')
          expect(date).to be_eql Date.new(2017, 4, 1)
        end
      end

      context 'when the reference is lower case' do
        it 'returns the correct date' do
          date = described_class.get(20, 'j740h')
          expect(date).to be_eql Date.new(2015, 6, 1)
        end
      end
    end
  end
end
