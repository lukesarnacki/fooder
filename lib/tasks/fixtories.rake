YAML::ENGINE.yamler = 'syck'

namespace :fixtories do
  desc "Generate fixtures from fixtories files"
  task :generate => [:environment, "db:test:prepare"] do
    require "fixtories"
    require 'database_cleaner'
    require 'active_record/fixtures'
    require Rails.root.join("spec/fixtories")
    Fixtories.generate
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  desc "Load fixtures"
  task :load => [:environment] do
    require "fixtories"
    require 'database_cleaner'
    require 'active_record/fixtures'
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
    require Rails.root.join("spec/fixtories")
  end
end
