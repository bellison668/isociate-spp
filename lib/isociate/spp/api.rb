module Isociate
  module Spp
    class Api
      class << self
        # def klass_method
        #   nil
        # end
      end

      def awards
        self._get_tcr_awards_from_spp.map do |_award|
          TCRAward.new
        end
        
      end

      def _get_tcr_awards_from_spp
        # Make call to Savon
        
      end

    end
  end
end
