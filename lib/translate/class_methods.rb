module Typus
  module Translate

    module ClassMethods
      def typus_translate(*args)
        return if typus_translates?

        cattr_accessor :typus_translate_options
        self.typus_translate_options ||= args.extract_options!
        self.typus_translate_options[:fallbacks_for_empty_translations] = Typus::Translate::Configuration.config['fallbacks_for_empty_translations'] if self.typus_translate_options[:fallbacks_for_empty_translations].nil? && !Typus::Translate::Configuration.config['fallbacks_for_empty_translations'].nil?
        fields = args
        as = self.typus_translate_options.delete(:as) || :admin

        args << self.typus_translate_options
        translates *args

        extend TemplateMethods

        #Support for rails whitelist mode
        # unless defined?(accessible_attributes) && accessible_attributes.empty?
        #   attr_accessible :translations_attributes, :as => as
        #   self::Translation.attr_accessible :locale, :as => as
        #   fields.each do |f|
        #     self::Translation.attr_accessible f, :as => as
        #   end
        # end
        accepts_nested_attributes_for :translations

      end

      def typus_translates?
        included_modules.include?(TemplateMethods)
      end
    end

    module TemplateMethods
      def typus_template(attribute)
        if self.translated_attribute_names.include? attribute.to_sym
          'translate'
        else
          super(attribute)
        end
      end
    end

  end
end
