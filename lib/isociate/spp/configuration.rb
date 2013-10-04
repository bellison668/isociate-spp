# Isociate::Spp.configure do |config|
#   config.certificate_path = "/path/ot/my/spp/client/certificate"
#   config.certificate_passowrd = "somebadpassword"
# end
#
# api = Isociate::Spp::Api.new
# awards = api.awards.map do |data|
#   award = Molecule::Award.new
#   award.amount = data.amount
#   ...
#   award.save
# end
#
# class Isociate::Spp::Api
#   include Isociate::Spp::ClientSupport
#
#   def awards
#     client = Isociate::Spp.client
#     client.certificate_path = Isociate::Spp.configuration.certifcate_path
#     client.certificate_password = Isocaiate::Spp.configuration.certificate_password
#     client.connect
#     ... do stuff
#   end
# end

module Isociate
  module Spp
    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    class Configuration
      attr_accessor :certificate_path, :certificate_password

      def intialize

      end
    end
  end
end
