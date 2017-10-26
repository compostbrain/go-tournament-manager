source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.3"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"

gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "turbolinks", "~> 5"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara", "~> 2.15", ">= 2.15.1"
  gem "database_cleaner", "~> 1.6", ">= 1.6.1"
  gem "factory_girl_rails", "~> 4.8"
  gem "poltergeist"
  gem "rspec-rails", "~> 3.6", ">= 3.6.1"
  gem "rubocop"
  gem "shoulda"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "meta_request"
  gem "pry-rails"
  gem "rails-erd"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "devise", "~> 4.3"
gem "faker", git: "git://github.com/stympy/faker.git", branch: "master"
gem "jquery-rails"
gem "material_icons"
gem "materialize-sass", "~> 0.100.2"
gem "simple_form"
gem "slim"
gem "swissper"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "webpacker", github: "rails/webpacker"
