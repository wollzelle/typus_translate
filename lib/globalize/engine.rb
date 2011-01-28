require "typus_globalize"
require "globalize3"
require "rails"


module Typus
  module Globalize
    class Engine < Rails::Engine

      initializer "static assets" do |app|
        app.middleware.use ::ActionDispatch::Static, "#{root}/public"
      end     

      def initialize
        Typus::Globalize::Configuration.config!
      end
    end
  end
end