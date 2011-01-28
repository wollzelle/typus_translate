module Typus
  module Globalize
  if defined?(Rails)
    require 'globalize/engine' 
  end

  autoload :Configuration, "globalize/configuration"
end
end

