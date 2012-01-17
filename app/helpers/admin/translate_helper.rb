module Admin::TranslateHelper

  class Translator

    extend ActiveModel::Naming
    extend ActionView::Helpers

    ##
    # Class Methods
    #

    @@locales = Typus::Translate::Configuration.config['locales'] rescue nil
    @@forms = {}

    cattr_accessor :forms, :locales

    def self.setup_model(model)
      # make sure each locale exists
      # to setup the form fields/tabs for each locale
      translations_empty = model.translations.empty?
      @@locales.each do |locale, name|
        model.translations.find_or_initialize_by_locale(locale) if translations_empty
      end
    end

    def self.locales_json
      raw @@locales.to_json rescue []
    end

    def self.field_name_for(builder, attribute)
      "#{builder.object_name}[#{attribute.to_s.sub(/\?$/,"")}]"
    end

    ##
    # Instance Methods
    #

    def initialize(model = nil, attribute = nil)
      @model = model
      @attribute = attribute
    end

    def setup?
      return true if @setup
      @setup = true
      return false
    end

    def setup
      yield unless self.setup?
    end

    def field_type(field)
      case @model.translations.columns_hash[@attribute].type
      when :text
        field.text_area(@attribute)
      else
        field.text_field(@attribute, :class => :text)
      end
    end

  end
end