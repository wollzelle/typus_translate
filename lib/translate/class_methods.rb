module Typus
  module Translate
    module ClassMethods
      def typus_translate(*args)
        return if typus_translates?        
        options = args.extract_options!
        translates *args
        accepts_nested_attributes_for :translations  
        extend TemplateMethods
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