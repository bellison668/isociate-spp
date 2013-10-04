module Isociate
  module Spp
    class TCRAward
      attr_accessor :source, :sink, :amount, :price, :date_range, :instrument, :bid_identifier, :award_identifier, :raw_data
      
      def initialize(options=nil)
        (options || {}).each do |key,value|
          instance_variable_set("@#{key}", value) unless value.nil?
        end  
      end  

    end
  end
end
