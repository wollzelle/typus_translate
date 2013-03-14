# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "translate/version"

Gem::Specification.new do |s|
  s.name        = "typus_translate"
  s.version     = Typus::Translate::VERSION
  s.authors     = ["Thomas Koenig", "William Meleyal"]
  s.email       = "team@wollzelle.com"
  s.homepage    = "http://wollzelle.com"
  s.summary     = "Translate module for Typus"
  s.description = "Adds support for editing multiple languages"

  s.rubyforge_project = "typus_translate"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 3.1.0"
  s.add_dependency "typus"
  s.add_dependency "globalize3", "~> 0.2.0"
  s.add_dependency "coffee-rails", ">= 3.1.0"
  s.add_dependency "jquery-rails"
  s.add_dependency "backbone-on-rails"
end