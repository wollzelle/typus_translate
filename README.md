# typus_translate

https://github.com/wollzelle/typus_translate

## Installation

In your `Gemfile`:

    gem 'typus_translate'

## Configuration

**In `config/translate.yml`:**

    locales: 
      de: "Deutsch"
      en: "English"


**In your migration:**

    class CreatePosts < ActiveRecord::Migration
      def up
        create_table :posts do |t|
          t.timestamps
        end
        Post.create_translation_table! :title => :string, :text => :text
      end
      def down
        drop_table :posts
        Post.drop_translation_table!
      end
    end

**In your model:**

    class Post < ActiveRecord::Base
      translates :title, :text
      accepts_nested_attributes_for :translations
      ...
    
**In `config/typus/application.yml`**

    Posts:
      fields:
        form: translate
        options:
          templates:
            translate: translate    


## Copyright

Copyright (c) 2011 Wollzelle GmbH. See LICENSE for details.
