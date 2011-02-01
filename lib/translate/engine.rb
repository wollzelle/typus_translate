require "typus_translate"
require "globalize3"
require "rails"


module Typus
  module Translate
    class Engine < Rails::Engine

      initializer "static assets" do |app|
        app.middleware.use ::ActionDispatch::Static, "#{root}/public"
      end     

      def initialize
        Typus::Translate::Configuration.config!
      end
    end
  end
end