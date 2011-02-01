module Typus
  module Translate
  if defined?(Rails)
    require 'translate/engine' 
  end

  autoload :Configuration, "translate/configuration"
end
end

