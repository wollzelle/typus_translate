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

**In your model:**

    class Post < ActiveRecord::Base
      translates :title, :text
      accepts_nested_attributes_for :translations
      ...

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

**In `config/typus/application.yml`**

    Posts:
      fields:
        form: translate
        options:
          templates:
            translate: translate    

## Copyright

Copyright (c) 2011 Wollzelle GmbH. See LICENSE for details.
