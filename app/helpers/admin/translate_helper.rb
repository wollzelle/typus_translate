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

    def self.setup_translations(translations)
      # make sure each locale exists
      # to setup the form fields/tabs for each locale
      current_translations = translations.collect { |t| t.locale.to_s }
      missing_translations = @@locales.keys - current_translations
      missing_translations.each do |locale|
        translations.find_or_initialize_by_locale(locale)
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
        options = { class: 'form-control', rows: 15 }
        options.merge!(:class => "markitup") if defined?(Typus::Markitup)
        field.text_area(@attribute, options)
      else
        field.text_field(@attribute, class: 'form-control')
      end
    end

  end
end
