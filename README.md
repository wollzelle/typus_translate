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

**In `config/typus_translate.yml`:**

    locales:
      de: "Deutsch"
      en: "English"

You can also adjust the configuration on how to handle empty translations globally:

    fallbacks_for_empty_translations: true


**In your model:**

    class Post < ActiveRecord::Base
      typus_translate :title, :body
      ...

**Support for (soft)limits:**
    class Post < ActiveRecord::Base
      typus_translate :title, :body, limit: { body: 300 }


**In your migration:**

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
    
### Warning

This gem  currently does not  support the new rails "Enforce whitelist mode for mass assignment" mode.
So to make this gem work you currently have to comment out the following line in `application.rb`:

    # config.active_record.whitelist_attributes = true

## Todo

* add support for `config.active_record.whitelist_attributes = true`

## Copyright

Copyright (c) 2011 Wollzelle GmbH. See LICENSE for details.
