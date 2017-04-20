$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "model_table/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "model_table"
  s.version     = ModelTable::VERSION
  s.authors     = ["Henry Morgan"]
  s.email       = ["henry@cd2solutions.co.uk"]
  s.summary     = "Generate index tables from a table definition and a collection"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
