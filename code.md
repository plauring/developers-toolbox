RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
  end
end

config.before(:all) do
  DatabaseCleaner.clean_with(:truncation, reset_ids: true)
end

config.before(:all) do
  DatabaseCleaner.strategy = :truncation, { reset_ids: true }
end

config.before(:all, js: true) do
  DatabaseCleaner.strategy = :truncation, { reset_ids: true }
end

config.before(:all) do
  DatabaseCleaner.start
end

config.before(:all) do
  DatabaseCleaner.clean
end

config.after(:all) do
  DatabaseCleaner.start
end

config.after(:all) do
  DatabaseCleaner.clean
end
