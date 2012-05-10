module Typus
  module Translate

    if defined?(Rails)
      require 'translate/engine'
    end

    if defined?(ActiveRecord)
      require 'translate/class_methods'
      ActiveRecord::Base.extend(Typus::Translate::ClassMethods)
    end

    autoload :Configuration, "translate/configuration"

  end
end
