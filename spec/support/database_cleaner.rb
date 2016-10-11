require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, reset_ids: true)
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation, { reset_ids: true }
  end

  config.before(:suite) do
    DatabaseCleaner.start
  end

  config.before(:suite) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    DatabaseCleaner.start
  end

  config.after(:suite) do
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.clean_with(:truncation, reset_ids: true)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation, { reset_ids: true }
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation, { reset_ids: true }
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end

  config.after(:each) do
    DatabaseCleaner.start
  end
end
