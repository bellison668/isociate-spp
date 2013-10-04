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
          let(:tcr_award) do
            double(:[] => "2013-01-01")
          end
          let(:tcr_awards){ [tcr_award] }

          it { should be_an Array }
          it { should_not be_empty }
          it { should have(tcr_awards.size).items }
          its(:first) { should be_a Isociate::Spp::TCRAward }
        end 
      end

      describe '#_get_tcr_awards_from_spp' do
        subject { instance.send(:_get_tcr_awards_from_spp) }

        let(:result) do
          { header: {}, body: { auction_tcrs: auction_tcrs } }
        end
        let(:auction_tcrs) { [] }

        before { instance.should_receive(:_private_auction_result_download_hash).and_return(result) }

        it { should be_an Array }
        it { should have(auction_tcrs.size).items }
      end

      describe '#_client_for' do
        subject { instance.send(:_client_for, wsdl) }

        let(:wsdl) { "http://foo.com" }
        let(:client) { double }

        before do
          Savon.should_receive(:client).with(hash_including(wsdl: wsdl)).and_return(client)
        end

        it { should eq client }
      end

      describe '#_private_auction_result_download_hash' do
        subject { instance.send(:_private_auction_result_download_hash) }

        before do
          instance.should_receive(:_client_for).with(/TCR_TcrDownload\?WSDL/).and_return(proxy)
          proxy.should_receive(:call).with(:getPrivateAuctionResultDownload, anything()).and_return(double(hash: hash))
        end

        let(:proxy) { double }
        let(:hash) { {} }

        it { should eq hash }
      end
    end
  end
end
