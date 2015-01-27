$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seo_meta_tags/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "seo_meta_tags"
  s.version     = SeoMetaTags::VERSION
  s.authors     = ["Serg Stavskiy"]
  s.email       = ["stavskiys@gmail.com"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "haml-rails"
  s.add_dependency "will_paginate", "~> 3.0"

  s.add_development_dependency "sqlite3"
end
