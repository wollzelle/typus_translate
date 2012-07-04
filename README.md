# typus_translate

Translate module for Typus, adds support for editing multiple languages.

* https://github.com/wollzelle/typus_translate
* https://github.com/fesplugas/typus

## Installation

### Rails >= 3.1

In your `Gemfile`:

    gem 'typus_translate'

### Rails <= 3.0

In your `Gemfile`:

    gem 'typus_translate', '~> 3.0'

## Configuration

### In `config/typus_translate.yml`:

    locales:
      de: "Deutsch"
      en: "English"

You can also adjust the configuration on how to handle empty translations globally:

    fallbacks_for_empty_translations: true



### In your model

    class Post < ActiveRecord::Base
      typus_translate :title, :body
      ...

**Support for (soft)limits:**

    class Post < ActiveRecord::Base
      typus_translate :title, :body, limit: { body: 300 }

** Support for mass assignment security**

This gem supports the rails mass_assignment security protection.
If you use this together with typus, you must assign the correct roles in the options (`:admin` is set by default if whitelisting has been enabled).

      typus_translate :title, :body, :as => [:editor, :admin]


### In your migration

    class CreatePosts < ActiveRecord::Migration
      def up
        create_table :posts do |t|
          t.timestamps
        end
        Post.create_translation_table! :title => :string, :body => :text
      end
      def down
        drop_table :posts
        Post.drop_translation_table!
      end
    end


## Copyright

Copyright (c) 2011 Wollzelle GmbH. See LICENSE for details.
