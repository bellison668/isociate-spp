
shared_context "module" do
  let(:mixin) { self.described_class }
  let(:klass) { Object }
  let(:instance) { klass.new }
  before {
    klass.send(:include, self.class.top_level_description.constantize)
  }
end

shared_context "model concern" do
  include_context "module"

  module ModelConcernSupport; end

  let(:klass_def)   do
    Class.new(Object) do
      include Mongoid::Document
    end
  end
  let(:klass_name) do 
    mixin.to_s
  end
  let(:proxy_class_name) do
    "#{mixin.to_s.split('::').reverse.first}Proxy"
  end
  let(:klass) do 
    ModelConcernSupport.const_set(proxy_class_name, klass_def) unless ModelConcernSupport.const_defined?(proxy_class_name)
    k = ModelConcernSupport.const_get(proxy_class_name)
    k.send(:store_in, {collection: proxy_class_name.underscore.pluralize})
    k
  end
end
