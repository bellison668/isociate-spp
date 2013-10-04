require 'spec_helper'

describe Isociate::Spp::Api do
  let(:klass) { self.described_class }

  describe :class do
    subject { klass }

    # it { should respond_to :klass_method }

    describe :methods do
      # describe '::klass_method' do
      #   subject { klass::klass_method }
      # end
    end
  end

  describe :instance do
    let(:instance) { klass.new }
    subject { instance }

    it { should respond_to :awards }

    describe :methods do
      describe '#awards' do
        subject { instance.awards }
        before do 
          instance.should_receive(:_get_tcr_awards_from_spp).and_return(tcr_awards)
        end

        context "when there are no awards" do
          let(:tcr_awards){[]}
          it { should be_an Array }
          it { should be_empty }
        end 

       context "when there are some awards" do
          let(:tcr_awards){[double]}
          it { should be_an Array }
          it { should_not be_empty }
          it { should have(tcr_awards.size).items }
          its (:first) { should be_a Isociate::Spp::TCRAward }
        end 

      end
    end
  end
end
