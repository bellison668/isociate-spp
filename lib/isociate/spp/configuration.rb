# module Clearance
#   class << self
#     attr_accessor :configuration
#   end

#   def self.configure
#     self.configuration ||= Configuration.new
#     yield(configuration)
#   end

#   class Configuration
#     attr_accessor :mailer_sender

#     def initialize
#       @mailer_sender = 'donotreply@example.com'
#     end
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
