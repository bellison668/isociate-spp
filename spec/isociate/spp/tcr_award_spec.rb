require 'spec_helper'

describe Isociate::Spp::TCRAward do
  let(:klass) { self.described_class }

  describe :class do
    subject { klass }

    # it { should respond_to :klass_method }

    describe :methods do
      # describe '::klass_method' do
      #   subject { klass::klass_method }
      # end
    end

    describe :constructors do
      subject { klass.new(options) }

      context 'when no options are supplied' do 
        let(:options) { nil }
        its(:source) { should be_nil }
      end

      context 'when options are supplied' do 
        let(:options) { {:source => value}  }
        let(:value) { 123 }
        its(:source) { should eq value }

      end

    end
  end

  describe :instance do
    let(:instance) { klass.new }
    subject { instance }

    # it { should respond_to :some_method }

    it { should respond_to :source}
    it { should respond_to :sink}
    it { should respond_to :amount}
    it { should respond_to :price}
    it { should respond_to :date_range}
    it { should respond_to :instrument}
    it { should respond_to :bid_identifier}
    it { should respond_to :award_identifier}
    it { should respond_to :raw_data}


  
    describe :methods do
      # describe '#some_method' do
      #   subject { instance.some_method }

      # end
    end
  end

end