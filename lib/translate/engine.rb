require "typus_translate"
require "globalize"
require "rails"

module Typus
  module Translate
    class Engine < Rails::Engine
      def initialize
        Typus::Translate::Configuration.config!
      end
    end
  end
end
