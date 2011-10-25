# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{typus_translate}
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Thomas Koenig}, %q{William Meleyal}, %q{I.C. Wiener}]
  s.date = %q{2011-10-25}
  s.description = %q{adds multilanguage support to typus}
  s.email = %q{team@wollzelle.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md",
    "TODO"
  ]
  s.files = [
    "app/views/admin/templates/_translate.html.erb",
    "lib/translate/configuration.rb",
    "lib/translate/engine.rb",
    "lib/typus_translate.rb",
    "public/vendor/typus/translate/jquery.cookie.js",
    "public/vendor/typus/translate/translate.css",
    "public/vendor/typus/translate/translate.js"
  ]
  s.homepage = %q{http://wollzelle.com}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{globalize3 for typus}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<globalize3>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<globalize3>, [">= 0"])
    else
      s.add_dependency(%q<globalize3>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<globalize3>, [">= 0"])
    end
  else
    s.add_dependency(%q<globalize3>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<globalize3>, [">= 0"])
  end
end

