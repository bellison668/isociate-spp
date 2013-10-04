module Isociate
  module SoapSupport
    def self.included(base)
      base.send(:extend, ClassMethods)
    end

    # def some_instance_method
    # end

    module ClassMethods
      # def some_class_method
      # end
    end
  end
end
