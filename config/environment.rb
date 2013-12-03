# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Feedme::Application.initialize!
Feedme::Application.configure do
config.gem "feedzirra", :lib => "feedzirra", :source => "http://gems.github.com"  
end