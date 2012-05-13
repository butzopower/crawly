module RequestSpecHelpers
end

RSpec.configure do |config|
  config.include RequestSpecHelpers, :type => :request
end