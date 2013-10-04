require 'spec_helper'

describe Isociate::Spp::Api do
  let(:klass) { self.described_class }

  describe :class do
    subject { klass }

    it { should respond_to :klass_method }

    describe :methods do
      describe '::klass_method' do
        subject { klass::klass_method }
      end
    end
  end

  describe :instance do
    let(:instance) { klass.new }
    subject { instance }

    it { should respond_to :some_method }

    describe :methods do
      describe '#some_method' do
        subject { instance.some_method }

      end
    end
  end
end
