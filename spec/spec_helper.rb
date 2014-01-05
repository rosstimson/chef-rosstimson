# spec_helper.rb

require 'chefspec'

# Show coverage report
at_exit { ChefSpec::Coverage.report! }
