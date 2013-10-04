# require 'isociate/soap_support'
require 'active_support/inflector'
require 'savon'

module Isociate
  module Spp
    class Api
      include Isociate::SoapSupport

      class << self
        # def klass_method
        #   nil
        # end
      end

      def awards
        # invoke ws call; response should be a compressed binary
        # uncompress the binary; the result should be one or more XML files
        # for each xml file:
        #   for each auction_tcr in auction_tcrs:
        #     create a TCRAward
        # flatten
        self._get_tcr_awards_from_spp.map do |auction_tcr_hash|
          award = TCRAward.new
          award.source = auction_tcr_hash[:source].underscore.to_sym
          award.sink = auction_tcr_hash[:sink].underscore.to_sym
          award.amount = auction_tcr_hash[:awarded_mw].to_f
          award.price = auction_tcr_hash[:awarded_price].to_f
          award.date_range = (Date.parse(auction_tcr_hash[:start_date])..Date.parse(auction_tcr_hash[:end_date]))
          award.instrument = auction_tcr_hash[:bid_type].underscore.to_sym
          award.bid_identifier = auction_tcr_hash[:bid]
          award.award_identifier = auction_tcr_hash[:aid]
          award.raw_data = auction_tcr_hash.clone
          award
        end
      end

      def _get_tcr_awards_from_spp
        result = self._private_auction_result_download_hash()
        result[:body][:auction_tcrs]
      end

      def _client_for(wsdl)
        Savon.client(wsdl: wsdl) do
          convert_request_keys_to :camelcase
          strip_namespaces true
          advanced_typecasting true
          response_parser :nokogiri
        end
      end

      def _private_auction_result_download_hash
        message = { 
          message: {
            asset_owner: { 
              ao_name: "foo" 
            },
            market_name: "2012AnnualAuction",
            round_level: "ROUND_1",
            download_type: "BID_AND_OFFER",
            download_file_format: "XML"
          }
        }
        _client_for("https://mpsandbox.itespp.org/TCR_TcrDownload/ws/TCR_TcrDownload?WSDL").call(:getPrivateAuctionResultDownload, message).hash
      end
    end
  end
end
